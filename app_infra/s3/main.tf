module "s3_bucket" {
    source = "github.com/yusuf1207/Project_Modules//modules/s3_module"
    bucket_name = var.bucket_name
}