#!/bin/bash

snap install helm --classic

git clone https://github.com/MartinP1199/onpk-sempr.git

cp -r onpk-sempr/helm/ . 
cd appbackend/
helm dependency build Chart.yaml
helm install backend .

cd ../appfrontend/
helm dependency build Chart.yaml
helm install frontend .

