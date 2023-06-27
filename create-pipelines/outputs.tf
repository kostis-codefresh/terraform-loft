output "project_id" {
  value = codefresh_project.example-project.id
}

output "pipeline_id" {
  value = codefresh_pipeline.example-pipeline.id
}

output "repo_name" {
  value = github_repository.my-new-demo-repo.full_name
}