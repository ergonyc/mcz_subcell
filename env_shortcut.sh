#!bash 

conda config --add channels conda-forge
conda config --set channel_priority strict

conda create -n napariGPU python=3.9 
conda activate napariGPU
conda install pip
pip install 'napari[all]'
pip install scipy scikit-learn matplotlib jupyter
pip install 'aicsimageio[all]'
pip install aicsimageio 'aicspylibczi>=3.0.5'
pip install 'aicspylibczi>=3.0.5'

conda install -c conda-forge napari bioformats_jar
#pip install jupyter_contrib_nbextensions jupyter_nbextensions_configurator 
#jupyter contrib nbextension install --user


#which plugins by default?
pip install napari-aicsimageio  
#pip install napari-simpleitk-image-processing
pip install aicssegmentation



sudo apt-get install -y libegl1 libdbus-1-3 libxkbcommon-x11-0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-xinerama0 libxcb-xinput0 libxcb-xfixes0

conda create -n napariGPU2 python=3.9 
conda activate napariGPU2
conda install pip napari bioformats_jar
#pip install 'napari[all]'
pip install scipy scikit-learn matplotlib #jupyter
pip install 'aicsimageio[all]'
#pip install aicsimageio 'aicspylibczi>=3.0.5'
pip install 'aicspylibczi>=3.0.5'

pip install napari-aicsimageio  
pip install aicssegmentation





# trying to encapsulate in conda... 
mamba create -n mapari python=3.9 pip
mamba activate mapari
mamba install napari bioformats_jar
#pip install 'napari[all]'
pip install scipy scikit-learn matplotlib #jupyter
pip install 'aicsimageio[all]'
#pip install aicsimageio 'aicspylibczi>=3.0.5'
pip install 'aicspylibczi>=3.0.5'

pip install napari-aicsimageio  
pip install aicssegmentation




# trying to encapsulate in conda... 
mamba create -n mapari2 python=3.9 pip bioformats_jar
mamba activate mapari2
pip install 'napari[all]'
pip install scipy scikit-learn matplotlib #jupyter
#pip install 'aicsimageio[all]'
pip install aicsimageio 'aicspylibczi>=3.0.5'
#pip install 'aicspylibczi>=3.0.5'

pip install napari-aicsimageio  
pip install aicssegmentation
