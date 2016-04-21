#!py
#coding = utf-8
import os
import yaml

def run():
    config = {}
    globe_configure=''
    group_configure=''
    host_configure=''
    log_path = '/var/log/salt/client/'
    '''
    '''
    id = __opts__['id']
    group_id = id.split('-')[-1]
    host_id = id.split('-')[1]
    pillar_root = __opts__['pillar_roots']['base'][0]
    globe_configure_path = '%s/custom/globe.yaml' % pillar_root
    group_configure_path = '%s/custom/group/%s.yaml' %(pillar_root,group_id)
    host_configure_path = '%s/custom/host/%s.yaml' %(pillar_root,host_id)

    #get globe/group/host configuration parameters
    if os.path.isfile(globe_configure_path):
        globe_configure = open(globe_configure_path).read()
    if os.path.isfile(group_configure_path):
        group_configure = open(group_configure_path).read()
    if os.path.isfile(host_configure_path):
    	host_configure = open(host_configure_path).read()
    #merge configure
    configure = globe_configure+group_configure+host_configure
    temp_config = yaml.load(configure)
    #write logs
    if os.path.exists(log_path) != True:
        os.makedirs(log_path)
    if log_path[-1] != '/':
        log_path = log_path+'/'
    f = file(log_path+host_id+'.log','w')
    f.write(configure)
    config['custom'] = temp_config
    return config