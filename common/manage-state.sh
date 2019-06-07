function load_state() {
    source $WORK_DIR/state.env
}

function write_state() {
    touch $WORK_DIR/state.env
    echo "# Updated $(date)" > $WORK_DIR/state.env
    echo "export CSM_PROVISIONED=Y" >> $WORK_DIR/state.env
    echo "export KOPS_GCE=${KOPS_GCE}" >> $WORK_DIR/state.env
    echo "export KOPS_AWS=${KOPS_AWS}" >> $WORK_DIR/state.env
    echo "export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" >> $WORK_DIR/state.env
    echo "export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" >> $WORK_DIR/state.env
}
