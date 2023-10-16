---
title: "GCP iam roles assignments"
date: 2023-10-13T18:24:16+02:00
draft: false
categories: ['gcp']
---

Today I Learned: "GCP iam roles assignment"

To list all predefined rules:
```
❯ gcloud iam roles list | head -10
---
description: Ability to view or act on access approval requests and view configuration
etag: AA==
name: roles/accessapproval.approver
stage: GA
title: Access Approval Approver
---
description: Ability to update the Access Approval configuration
etag: AA==
name: roles/accessapproval.configEditor
```

To list custom roles for project:
```
❯ gcloud iam roles list --project=<project_name> | head -10
---
description: A role to do AMC for firewalls 
etag: BwX1yNbeoeM=
name: projects/composableops/roles/FW.ansible.projectname
stage: GA
title: A role to do AMC for firewalls
```
or organisation
```
gcloud iam roles list --organization=12345
```

Assign a role (custom or predefined) to ServiceAccount
```
gcloud projects add-iam-policy-binding <project_name> --member=serviceAccount:<sa_name>@<project_containing_sa>.iam.gserviceaccount.com --role=roles/cloudsql.admin
```

In above case we are:
- assigning role: `roles/cloudsql.admin`
- in project: `<project_name>`
- to sa: `<sa_name>@<project_containing_sa>.iam.gserviceaccount.com`
