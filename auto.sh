#/bin/sh

echo "Path to the git repo :"
read pathGit

cd $pathGit

echo "Création du commit"
git add .

git commit
git push origin
echo "Commit pushé !"


echo "Login docker "
docker login

echo "Building front..."
docker build ./frontend/cocktail -t keke65/pca_cloud_front

echo "Pushing front..."
docker push keke65/pca_cloud_front

echo "Building User..."
docker build ./backend/srv_user -t keke65/pca_cloud_srv_user

echo "Pushing User..."
docker push keke65/pca_cloud_srv_user

echo "Building Ctn..."
docker build ./backend/srv_ctn -t keke65/pca_cloud_srv_ctn

echo "Pushing Ctn..."
docker push keke65/pca_cloud_srv_ctn

echo "Building Data..."
docker build ./backend/srv_data -t keke65/pca_cloud_srv_data

echo "Pushing Data..."
docker push keke65/pca_cloud_srv_data

echo "Applying all Kubectl config and deployment..."
kubectl apply -f ./mysql_dep_secret.yml
kubectl apply -f ./mysql-configmap.yml
kubectl apply -f ./mysql_dep.yml
kubectl apply -f ./user-service.yml
kubectl apply -f ./data-service.yml
kubectl apply -f ./ctn-service.yml
kubectl apply -f ./front-service.yml