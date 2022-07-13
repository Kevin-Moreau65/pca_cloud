#/bin/sh

echo "Path to the git repo :"
read pathGit

cd $pathGit
git add .
git commit
git push origin

docker login

docker build ./frontend/cocktail -t keke65/pca_cloud_front
docker push keke65/pca_cloud_front

docker build ./backend/srv_user -t keke65/pca_cloud_srv_user
docker push keke65/pca_cloud_srv_user

docker build ./backend/srv_ctn -t keke65/pca_cloud_srv_ctn
docker push keke65/pca_cloud_srv_ctn

docker build ./backend/srv_data -t keke65/pca_cloud_srv_data
docker push keke65/pca_cloud_srv_data


kubectl apply -f ./mysql_dep_secret.yml
kubectl apply -f ./mysql_configmap.yml
kubectl apply -f ./mysql_dep.yml
kubectl apply -f ./user-service.yml
kubectl apply -f ./data-service.yml
kubectl apply -f ./ctn-service.yml
kubectl apply -f ./front-service.yml