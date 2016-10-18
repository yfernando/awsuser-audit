#!/bin/bash

source $1

export AWS_ACCESS_KEY_ID=${aws_access_key}
export AWS_SECRET_ACCESS_KEY=${aws_secret_key}
export AWS_SESSION_TOKEN=${security_token}

# jq '.Users[] | .UserName' test.json



aws iam list-users | jq '{'${register:-existing_users}': [
                                                            {
                                                                "aws_account": "1111111",
                                                                "aws_users": [
                                                                    .[] | .[] | .UserName
                                                                ]
                                                            }
                                                          ]
                                                        }'
# aws iam list-users | jq '{ansible_facts: { '${register:-existing_users}': [ "aws_account": "1234567", "aws_user_list": [  .aws_users | .Users[] | {Username: .UserName, CreateDate: .CreateDate} ]]}}'
# aws iam list-users | jq '{ '${register:-existing_users}': [.[] | .[] | .UserName]}'


### SB
# aws iam list-users | jq '{ ansible_facts: { '${register:-existing_users}': [.[] | .[] | select ( .UserName | contains("'${regex:-@mns.aws}'") ) | .UserName]}}'
# Output:
# =======
# ok: [localhost] =>
# {
#     "aws_users": {
#         "ansible_facts": {
#             "existing_users": []
#         },
#         "changed": false
#     }
# }
### SB


### aws cli output:
### ==============
# {
#     "aws_users": {
#         "Users": [
#             {
#                 "UserName": "arichings"
#                 "PasswordLastUsed": "2016-08-16T13:28:57Z",
#                 "CreateDate": "2016-01-11T15:50:01Z"
#             },
#             {
#                 "UserName": "arichings"
#                 "PasswordLastUsed": "2016-08-16T13:28:57Z",
#                 "CreateDate": "2016-01-11T15:50:01Z"
#             },
#}
# {
#     "aws_users": {
#         "Users": [
#             {
#                 "Arn": "arn:aws:iam::543687320164:user/arichings",
#                 "CreateDate": "2016-01-11T15:50:01Z",
#                 "Path": "/",
#                 "UserId": "AIDAJW3627FRIE5SZQWNS",
#                 "UserName": "arichings"
#             },
#             {
#                 "Arn": "arn:aws:iam::543687320164:user/Cloudability",
#                 "CreateDate": "2014-12-05T13:46:31Z",
#                 "Path": "/",
#                 "UserId": "AIDAJBPUWWY6NCFT6S23M",
#                 "UserName": "Cloudability"
#             },
#             {
#                 "Arn": "arn:aws:iam::543687320164:user/dclinton",
#                 "CreateDate": "2016-01-06T13:21:40Z",
#                 "PasswordLastUsed": "2016-08-16T13:28:57Z",
#                 "Path": "/",
#                 "UserId": "AIDAIEQBYEUOORIYAPGBY",
#                 "UserName": "dclinton"
#             },
#             {
#                 "Arn": "arn:aws:iam::543687320164:user/dlemos",
#                 "CreateDate": "2015-08-19T18:20:28Z",
#                 "PasswordLastUsed": "2016-09-14T12:36:26Z",
#                 "Path": "/",
#                 "UserId": "AIDAIPWTXRC5UJFYWW5UK",
#                 "UserName": "dlemos"
#             },
#             {
#                 "Arn": "arn:aws:iam::543687320164:user/Dummy",
#                 "CreateDate": "2016-10-12T12:26:57Z",
#                 "Path": "/",
#                 "UserId": "AIDAI7A2H2RKTHQUCOSJK",
#                 "UserName": "Dummy"
#             },
#             {
#                 "Arn": "arn:aws:iam::543687320164:user/gpugh",
#                 "CreateDate": "2014-11-05T10:09:20Z",
#                 "PasswordLastUsed": "2016-03-23T11:08:49Z",
#                 "Path": "/",
#                 "UserId": "AIDAIVMKRDW4HTTBBYEGS",
#                 "UserName": "gpugh"
#             },
#             {
#                 "Arn": "arn:aws:iam::543687320164:user/kfriesen",
#                 "CreateDate": "2016-08-02T10:33:35Z",
#                 "PasswordLastUsed": "2016-08-03T08:37:01Z",
#                 "Path": "/",
#                 "UserId": "AIDAJ7JA34CJOVSHIWZTS",
#                 "UserName": "kfriesen"
#             },
#             {
#                 "Arn": "arn:aws:iam::543687320164:user/ksurendra",
#                 "CreateDate": "2015-11-13T09:41:08Z",
#                 "PasswordLastUsed": "2016-09-14T05:45:29Z",
#                 "Path": "/",
#                 "UserId": "AIDAJTMICWGJYY27QDWM2",
#                 "UserName": "ksurendra"
#             },
#             {
#                 "Arn": "arn:aws:iam::543687320164:user/Maintainer",
#                 "CreateDate": "2016-10-12T12:13:07Z",
#                 "Path": "/",
#                 "UserId": "AIDAIUTRG2AMXVLQHSQHE",
#                 "UserName": "Maintainer"
#             },
#             {
#                 "Arn": "arn:aws:iam::543687320164:user/None",
#                 "CreateDate": "2016-10-13T14:14:23Z",
#                 "Path": "/",
#                 "UserId": "AIDAIQNOI55R6H7FMELFQ",
#                 "UserName": "None"
#             },
#             {
#                 "Arn": "arn:aws:iam::543687320164:user/pbailey",
#                 "CreateDate": "2016-01-14T12:48:00Z",
#                 "PasswordLastUsed": "2016-08-10T11:11:04Z",
#                 "Path": "/",
#                 "UserId": "AIDAJEHMS3E5G33SA3DWS",
#                 "UserName": "pbailey"
#             },
#             {
#                 "Arn": "arn:aws:iam::543687320164:user/peterwang",
#                 "CreateDate": "2016-05-19T16:52:16Z",
#                 "PasswordLastUsed": "2016-10-15T14:14:17Z",
#                 "Path": "/",
#                 "UserId": "AIDAIOOTXXTPJG5GRISJ6",
#                 "UserName": "peterwang"
#             },
#             {
#                 "Arn": "arn:aws:iam::543687320164:user/sgandham",
#                 "CreateDate": "2016-02-08T16:10:38Z",
#                 "PasswordLastUsed": "2016-10-04T11:00:56Z",
#                 "Path": "/",
#                 "UserId": "AIDAIM66FWI4WA5BPDP2E",
#                 "UserName": "sgandham"
#             }
#         ],
#         "changed": false
#     }
# }
