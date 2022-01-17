# Template Repository for Research Papers with Python Code
##Metadata
- Author: [Peter Steiner](mailto:peter.steiner@tu-dresden.de)
- Conference: Forschungsseminar "Sprache und Kognition", 
Institute for Acoustics and Speech Communication, Technische Universität Dresden, 
Dresden, Germany
- Weblink: [https://github.com/renierts/TemplateRepositoryPython](https://github.com/renierts/TemplateRepositoryPython)

## Abstract
This is a template repository for Python code accompanying a research paper
and should allow to reproduce the results from the paper.

This template provides everything to getting started. and it can directly be used
for basically any research paper.

We propose to use the following structure of this README:
- Title of the paper
- Metadata:
    - Metadata contains the author names, journal/conference, weblinks, such as the 
Digital Object Identifier(DOI)etc.
- Abstract:
    - The abstract is either the abstract of the paper or summarize the paper in another
    way.
- File list:
    - The file list contains all files provided in the repository together with a 
    short description.
- Usage:
    - How can users get started with your research code. This contains setting up a 
    installing packages in a virtual environment `venv` and running one `main.py` that
    includes your main code. 
    - Very important and often forgotten: How can the data to reproduce the results be
    obtained?
    - In case of a Jupyter notebook, it is strongly recommended to add a link to 
    [Binder](https://mybinder.org/).
- Acknowledgments:
    - Any kind of required funding information 
    - other acknowledgments, such as project partners, contributors, family etc.
- License:
    - Reference to the license of your code - how can readers re-use it?
- Referencing:
    - How can your work be cited? Ideally, provide a bibtex entry of the paper.

## File list
The following files are provided in this repository
- `run.sh`: UNIX Bash script to reproduce the Figures in the paper.
- `run_jupyter-lab.sh`: UNIX Bash script to start the Jupyter Notebook for the paper.
- `run.bat`: Windows batch script to reproduce the Figures in the paper.
- `run_jupyter-lab.bat`: Windows batch script to start the Jupyter Notebook for the 
paper.
- `utils.py`: Utility functions for visualization, storing and loading data etc.
- `requirements.txt`: Text file containing all required Python modules to be installed
- `README.md`: The README displayed here.
- `LICENSE`: Textfile containing the license for this source code. You can find 
- `data/`: The optional directory `data` contains
    - `train.csv`: Training data as CSV file
    - `test.csv`: Test data as CSV file
    - After the run: pre-trained model and results as CSV file (if desired).

## Usage
The easiest way to reproduce the results is to use a service like 
[Binder](https://mybinder.org/) and run the Jupyter Notebook (if available). It is 
nowadays highly recommended, because this does not even require a local installation 
and Jupyter Notebooks are very intuitive to use.

Do not forget to add a badge from Binder as below. Therefore, you can simply paste the
link to your Github repository [here](https://mybinder.org/) and Binder will do the 
rest for you.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/renierts/TemplateRepositoryPython/HEAD?labpath=Example-Notebook.ipynb)

To run the scripts or to start the Jupyter Notebook locally, t first, please ensure 
that you have a valid Python distribution installed on your system. Here, at least 
Python 3.8 is required.

You can then call `run_jupyter-lab.bat` or `run_jupyter-lab.sh`.

Then, the easiest way to reproduce the results is to either download and extract this 
Github repository in the desired directory, open a Linux Shell and call `run.sh` or open 
a Windows powershell and call `run.bat`. 

In that way, a [Python venv](https://docs.python.org/3/library/venv.html) is created, 
where all required packages (specified by `requirements.txt`) are installed. 
Afterwards, the script `main.py` is excecuted with all default arguments activated in 
order to reproduce all results in the paper.

You can adjust the level of verbosity by adding or removing the character `v` in the 
string `-vvv` to make the script more or less verbose.

If you want to suppress the plots, you can simply remove the `--plot` argument.

If you do not want to store the result or the pre-trained model, you can remove the 
arguments `--export` or `--serialize`, respectively.


## Acknowledgements
This research was supported by
```diff
! Add funding information
```


## License and Referencing
This program is licensed under the GPLv3 license. If you in any way use this
code for research that results in publications, please cite our original
article listed above.

You can use the following BibTeX entry
```diff
! Add bibtex entry of the published paper
```
