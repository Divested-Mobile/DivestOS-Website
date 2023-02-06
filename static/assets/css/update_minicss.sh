rm mini*.css;
wget https://github.com/Chalarangelo/mini.css/raw/master/dist/mini-default.min.css;
wget https://github.com/Chalarangelo/mini.css/raw/master/dist/mini-dark.min.css;
sed -i 's/.apple-system/"Fira Sans", -apple-system/' mini*.css;
