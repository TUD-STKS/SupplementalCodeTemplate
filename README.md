# Template Repository for Research Papers with Python Code
##Metadata
- Author: [Peter Steiner](mailto:peter.steiner@tu-dresden.de)
- Conference: Forschungsseminar "Sprache und Kognition", 
Institute for Acoustics and Speech Communication, Technische Universität Dresden, 
Dresden, Germany
- Weblink: [https://github.com/renierts/TemplateRepositoryPython](https://github.com/renierts/TemplateRepositoryPython)

## Summary and Contents
This is a template repository for Python code accompanying a research paper
and should allow to reproduce the results from the paper.

This template provides everything to getting started. and it can directly be used
for basically any research paper.

We propose to use the following structure of this README:
- Title of the paper
- Metadata:
    - Metadata contains the author names, journal/conference, weblinks, such as the 
Digital Object Identifier(DOI)etc.
- Summary and Contents:
    - The summary is typically not the abstract of the paper but a summary of what the
     repo containts.
     - Take care of the Copyright of the publisher
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
    - Which defaults?
- Referencing:
    - How can your work be cited? Ideally, provide a bibtex entry of the paper.

## File list
- The following scripts are provided in this repository
    - `scripts/run.sh`: UNIX Bash script to reproduce the Figures in the paper.
    - `scripts/run_jupyter-lab.sh`: UNIX Bash script to start the Jupyter Notebook for 
   the paper.
    - `scripts/run.bat`: Windows batch script to reproduce the Figures in the paper.
    - `scripts/run_jupyter-lab.bat`: Windows batch script to start the Jupyter Notebook 
  for the paper.
- The following python code is provided in `src`
    - `src/file_handling.py`: Utility functions for storing and loading data and models.
    - `src/preprocessing.py`: Utility functions for preprocessing the dataset
    - `src/main.py`: The main script to reproduce all results.
- `requirements.txt`: Text file containing all required Python modules to be 
    installed
 -> pip freeze
- `README.md`: The README displayed here.
- `LICENSE`: Textfile containing the license for this source code. You can find 
- `data/`: The optional directory `data` contains
    - `train.csv`: Training data as CSV file
    - `test.csv`: Test data as CSV file
- `results/`
    - (Pre)-trained model as joblib file
    - Results as CSV file.

## Usage
The easiest way to reproduce the results is to use a service like 
[Binder](https://mybinder.org/) and run the Jupyter Notebook (if available). It is 
nowadays highly recommended, because this does not even require a local installation 
and Jupyter Notebooks are very intuitive to use.

Do not forget to add a badge from Binder as below. Therefore, you can simply paste the
link to your Github repository [here](https://mybinder.org/) and Binder will do the 
rest for you.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/renierts/TemplateRepositoryPython/HEAD?labpath=src%2FExample-Notebook.ipynb)

To run the scripts or to start the Jupyter Notebook locally, t first, please ensure 
that you have a valid Python distribution installed on your system. Here, at least 
Python 3.8 is required.

You can then call `run_jupyter-lab.ps1` or `run_jupyter-lab.sh`.

The individual steps to reproduce the results should be in the same order as in the 
paper. Great would be self-explanatory names for each step.

TODO: Show the individual steps to reproduce the results (e.g. data preprocessing, 
model setup, training, test)
```python
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import RandomizedSearchCV
from sklearn.utils.fixes import loguniform
from scipy.stats import uniform
from file_handling import (load_data)
from preprocessing import select_features

from pyrcn.extreme_learning_machine import ELMRegressor


training_data = load_data("../data/train.csv")
X, y, feature_trf = select_features(
    df=training_data, input_features=["GrLivArea"], target="SalePrice")
scaler = StandardScaler().fit(X)
X_train = scaler.transform(X)
y_train = y

model = RandomizedSearchCV(
    estimator=ELMRegressor(input_activation="relu", random_state=42,
                           hidden_layer_size=50),
    param_distributions={"input_scaling": uniform(loc=0, scale=2),
                         "bias_scaling": uniform(loc=0, scale=2),
                         "alpha": loguniform(1e-5, 1e1)},
    random_state=42, n_iter=200, refit=True).fit(X, y)

test_data = load_data("../data/test.csv")
X = feature_trf.transform(test_data)
X_test = scaler.transform(X)
y_pred = model.predict(X_test)
```

The aforementioned steps are summarized in the script `main.py`. The easiest way to 
reproduce the results is to either download and extract this 
Github repository in the desired directory, open a Linux Shell and call `run.sh` or open 
a Windows powershell and call `run.ps1`. 

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
