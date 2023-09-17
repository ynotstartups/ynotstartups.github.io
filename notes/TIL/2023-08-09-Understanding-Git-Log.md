# TIL - Understanding Git Log                                        - 09/Aug/23

1. commit object filename/hash `5a761fe` actually sits in `.git/objects/5a/761`
1. `index a871d21e..00000000` means `file hash before commit..file hash after commit`
   - `a871d21e` is the object representing the file, `000000` is no index /dev/null, this means deleting a file.
   - If it's new file it would be `00000000..a871d21e`
   - If it's change of some file contents, not new or delete, it would be `hash..hash` e.g. `abcs23rr..a871d21e`

```git
commit 5a761fe301ebfe45e0a72d99e619102cba149e6d (HEAD -> ON-1987-tiger-test-remove-aws-credentials, origin/ON-1987-tiger-test-remove-aws-credentials)
Author: ynotstartups <ynotstartups@gmail.com>
Date:   Tue Aug 8 18:15:54 2023 +0100

    remove not needed configure_aws.sh

    The following environment variables are provided in github action
    aws-actions/configure-aws-credentials@v2 used in docker-compose-dev.yml

diff --git a/.github/configure_aws.sh b/.github/configure_aws.sh
deleted file mode 100644
index a871d21e..00000000
--- a/.github/configure_aws.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-set -eu
-
-export_aws_credentials () {
-   awsProfile=${AWS_PROFILE:-default}
-   AWS_ACCESS_KEY_ID=$(aws --profile "$awsProfile" configure get aws_access_key_id)
-   AWS_SECRET_ACCESS_KEY=$(aws --profile "$awsProfile" configure get aws_secret_access_key)
-   AWS_SESSION_TOKEN=$(aws --profile "$awsProfile" configure get aws_session_token)
-   export AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
-
-}
-
-export_aws_credentials
```
