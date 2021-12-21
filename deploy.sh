echo "Pre-Build Steps:"
echo "authenticating with AWS ECR..."
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/g6i2u8l8

echo "Build Steps:"
echo "building image..."
docker build -t test .

echo "Tag Steps:"
echo "tagging stage"
docker tag test:latest public.ecr.aws/g6i2u8l8/test:latest

echo "Post-Build Steps:"
echo "pushing image to AWS ECR..."
docker push public.ecr.aws/g6i2u8l8/test:latest

# echo "updating AWS ECS service..."
# aws ecs update-service --cluster react-cluster --service react-sv --force-new-deployment

# echo "Done!"


