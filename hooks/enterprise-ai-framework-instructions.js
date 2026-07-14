#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

function readIfExists(filePath, maxChars) {
  try {
    const contents = fs.readFileSync(filePath, 'utf8').replace(/^\uFEFF/, '');
    return contents.length > maxChars ? contents.slice(0, maxChars) + '\n...' : contents;
  } catch (_) {
    return '';
  }
}

function findProjectRoot() {
  return process.env.QODER_PROJECT_DIR || process.env.PWD || process.cwd();
}

function buildContext(projectRoot) {
  const agentDir = path.join(projectRoot, '.agent');
  const agentsMd = readIfExists(path.join(projectRoot, 'AGENTS.md'), 5000);
  const runtime = readIfExists(path.join(agentDir, 'runtime.md'), 4000);
  const context = readIfExists(path.join(agentDir, 'context.md'), 4000);
  const structure = readIfExists(path.join(agentDir, 'structure.md'), 4000);
  const qoderRule = readIfExists(path.join(projectRoot, '.qoder', 'rules', 'enterprise-ai-framework.md'), 5000);

  const parts = [
    '# Enterprise AI Framework Hook Context',
    '',
    '你必须按 Enterprise AI Framework 工作。',
    '',
    '## 核心规则',
    '',
    '- 不要每次任务都全量扫描项目。',
    '- 优先复用现有代码、组件、样式、工具函数和业务流程。',
    '- 先分析，再设计，再实现，再测试，再总结。',
    '- 生成代码前必须确认 PHP、ThinkPHP、前端构建链路和项目结构。',
    '- 用户只要求分析、文档或评审时，不得修改代码。',
    '- 不确定的信息必须标记为“需确认”。',
    '- 支持快捷指令：INIT、API_DOC、LOGIC、BUG、FEATURE、REVIEW、FRONTEND、SQL_REVIEW、PROJECT_SCAN。',
    '',
  ];

  if (agentsMd) {
    parts.push('## AGENTS.md', '', agentsMd, '');
  }
  if (qoderRule) {
    parts.push('## Qoder Rule', '', qoderRule, '');
  }
  if (runtime || context || structure) {
    parts.push('## Project Context Cache', '');
    if (runtime) parts.push('### .agent/runtime.md', '', runtime, '');
    if (context) parts.push('### .agent/context.md', '', context, '');
    if (structure) parts.push('### .agent/structure.md', '', structure, '');
  } else {
    parts.push(
      '## Missing Project Context Cache',
      '',
      '未发现 `.agent/` 上下文。需要时提示用户执行：',
      '',
      '```bash',
      'bash ai-framework/scripts/scan_project.sh . --write',
      '```',
      '',
    );
  }

  return parts.join('\n');
}

function writeQoderHookOutput(context) {
  process.stdout.write(JSON.stringify({
    hookSpecificOutput: {
      hookEventName: 'UserPromptSubmit',
      additionalContext: context,
    },
  }));
}

let input = '';
let done = false;

function finish() {
  if (done) return;
  done = true;
  try {
    JSON.parse(input.replace(/^\uFEFF/, '') || '{}');
  } catch (_) {
    // Qoder hook payload shape may change. The context injection is still safe.
  }
  writeQoderHookOutput(buildContext(findProjectRoot()));
}

process.stdin.on('data', chunk => {
  input += chunk;
});
process.stdin.on('end', finish);
process.stdin.on('error', () => {
  finish();
  process.exit(0);
});
setTimeout(() => {
  finish();
  process.exit(0);
}, 1000).unref();
