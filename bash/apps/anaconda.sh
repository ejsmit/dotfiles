

# dont mess with my prompt.  I will handle it.
# see .condarc for conda.
export VIRTUAL_ENV_DISABLE_PROMPT=true

# this is not the correct way to configure miniconda.  it requires 'conda init'
# but that does not work for version controlled dotfiles and different usernames.
# system python still default until you 'conda activate'
[[ -d ~/miniconda3/etc/profile.d/conda.sh ]] && . ~/miniconda3/etc/profile.d/conda.sh;