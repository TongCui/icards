<!-- 
title: Git Workflow
from: work
create: 2020-09-24
tags: work,git,term
-->

## Git 分支管理策略

#### Progressive-Stability Workflow
- Pro Git 书中介绍
- master develop topic

#### Git Flow
- 2010
- feature develop release hotfix master

#### GitHub Flow
- master feature
- pull request

#### GitLab Flow
- master pre-producation production
- merge request

#### Trunk-Based-Development
- 小MR，尽快合入
- 开关系统，线上验证

#### 优缺点

|分支模型	|优点|缺点|
|--|--|--|
|Progressive-Stability Workflow	|简单|	合入 master 时存在并发问题；没有 hotfix 流程|
|Git Flow|	严谨，完善|	上手难度高；流程过于麻烦影响效率|
|GitHow Flow|	简单	master |发布太过随性；没有 hotfix 流程；长期分叉的 feature 分支容易发生冲突|
|GitLab Flow|	比较平衡	|长期分叉的 feature 分支容易发生冲突|
|TBD	|不容易冲突，对 CI/CD 友好	|对团队要求高；对基础设施要求高|
