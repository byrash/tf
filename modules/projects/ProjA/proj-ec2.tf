module "MyEc2Instance" {
  source        = "../../ec2"
  instance_type = "t2.large"
}
