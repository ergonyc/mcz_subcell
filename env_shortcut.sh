#!bash 

conda config --add channels conda-forge
conda config --set channel_priority strict

conda create -n  napariCPU python=3.9 
conda activate napariCPU
conda install pip
pip install 'napari[all]'
pip install scipy scikit-learn matplotlib jupyter
pip install 'aicsimageio[all]'
pip install aicsimageio 'aicspylibczi>=3.0.5'
conda install -c conda-forge bioformats_jar

pip install jupyter_contrib_nbextensions jupyter_nbextensions_configurator 
jupyter contrib nbextension install --user


#which plugins by default?
pip install napari-aicsimageio  
pip install napari-simpleitk-image-processing
