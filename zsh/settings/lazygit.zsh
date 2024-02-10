lg()
{

    export LAZYGIT_NEW_DIR_FILE="$HOME/tmp/lazygit"

    lazygit "$@"

    cd $(echo $LAZYGIT_NEW_DIR_FILE)
    # if [ -e $LAZYGIT_NEW_DIR_FILE ]; then
    #   lala=$LAZYGIT_NEW_DIR_FILE
    #   cd $(echo $lala)
    #         # rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    # fi
}
