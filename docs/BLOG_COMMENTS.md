# 블로그 댓글 관리

블로그 댓글은 무료·광고 없는 [giscus](https://giscus.app/ko)를 통해 GitHub Discussions에 저장됩니다. 댓글 작성자는 GitHub 로그인이 필요합니다.

## 댓글 확인과 삭제

1. 사이트 소유자 `chaephymath` 계정으로 GitHub에 로그인합니다.
2. [댓글 관리 화면](https://github.com/chaephymath/chaephymath.github.io/discussions/categories/announcements)을 엽니다.
3. 해당 글의 경로가 제목인 Discussion을 선택합니다.
4. 관리할 댓글의 `…` 메뉴에서 `Delete`를 선택하고 확인합니다. GitHub에서 삭제하면 블로그에도 반영됩니다.

댓글이 처음 작성되거나 글에 반응이 남겨지면 해당 글의 Discussion이 자동으로 만들어집니다. 한국어 글과 영어 글은 경로가 다르므로 댓글도 따로 관리됩니다.

## 새 글과 기존 댓글

- `_config.yml`의 기본값으로 모든 블로그 글에 댓글이 켜집니다.
- 특정 글에서 댓글을 끄려면 그 글의 front matter에 `giscus_comments: false`를 넣습니다. 기존 댓글은 GitHub에 남습니다.
- 글 제목을 바꿔도 댓글은 유지됩니다. 댓글 연결 기준은 URL 경로이므로, 이미 게시한 글의 주소를 바꿀 때는 기존 Discussion 제목도 함께 확인해야 합니다.
- `giscus.json`은 이 사이트에서만 댓글 위젯을 불러오도록 설정합니다. 사이트 도메인을 바꾸면 이 파일도 수정합니다.

## 최초 연결

Discussions가 활성화된 공개 저장소 `chaephymath/chaephymath.github.io`에 [giscus GitHub App](https://github.com/apps/giscus)을 설치해야 합니다. 설치 대상은 `Only select repositories`에서 이 저장소만 선택하면 됩니다.

저장소·카테고리 ID는 `_config.yml`에 설정되어 있습니다. 댓글 카테고리는 `Announcements`이며, 새 Discussion은 소유자와 giscus가 만들고 방문자는 그 아래에 댓글을 남깁니다.
