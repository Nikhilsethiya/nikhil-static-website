Terraform-static-website

I have created two resources as part of this task using Terraform: a resource group and a storage account to host a static website.

Build Pipeline: -

trigger:
- main

stages:
  - stage: build
    jobs:
      - job: build
        pool:
          name: 'my-agent'
        steps:
        - task: TerraformTaskV4@4
          inputs:
            provider: 'azurerm'
            command: 'init'
            backendServiceArm: 'Free Trial'
            backendAzureRmResourceGroupName: 'myResourceGroupBackend'
            backendAzureRmStorageAccountName: 'nikhilbackendstorage'
            backendAzureRmContainerName: 'backendcontainer'
            backendAzureRmKey: 'prod.terraform.tfstate'
        - task: TerraformTaskV4@4
          displayName: terraform validate
          inputs:
            provider: 'azurerm'
            command: 'validate'
        - task: TerraformTaskV4@4
          displayName: terraform fmt
          inputs:
            provider: 'azurerm'
            command: 'custom'
            outputTo: 'console'
            customCommand: 'fmt'
            environmentServiceNameAzureRM: 'Free Trial'
        - task: TerraformTaskV4@4
          displayName: terraform plan
          inputs:
            provider: 'azurerm'
            command: 'plan'
            environmentServiceNameAzureRM: 'Free Trial'
        - task: ArchiveFiles@2
          inputs:
            rootFolderOrFile: '$(Build.SourcesDirectory)/'
            includeRootFolder: false
            archiveType: 'zip'
            archiveFile: '$(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip'
            replaceExistingArchive: true
        - task: PublishBuildArtifacts@1
          inputs:
            PathtoPublish: '$(Build.ArtifactStagingDirectory)'
            ArtifactName: '$(Build.BuildId)-build'
            publishLocation: 'Container'



Relase Pipeline: -
![image](https://github.com/user-attachments/assets/944f39d9-f031-4328-98fb-2f42b47fe22c)
Stage 1 Deployment: -
Task 1.
  Extract the build artifact.
Task 2.
  Install terraform latest.
Task 3.
  Initialize the backend using terraform init.
Task 4.
  Apply the changes using terraform apply.

Stage 2 Destroy: -
After approved: -
Stage 1: -
Task 1.
  Extract the build artifact.
Task 2.
  Install terraform latest.
Task 3.
  Initialize the backend using terraform init.
Task 4.
  Destroy the changes using terraform destroy.
