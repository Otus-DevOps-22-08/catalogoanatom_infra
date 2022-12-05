#!/usr/bin/env python3
import json
import argparse

def my_inventory():
    return {
        'all': {
            'hosts': [db_ip, app_ip]
        },
        '_meta': {
            'hostvars': {
                app_ip: {
                    'hostname': 'app'
                },
                db_ip: {
                    'hostname': 'db'
                }
            }
        }
    }

def empty_inv(host):
    # There are my LAZZY! not implemented
    return {'_meta': {'hostvars': {'host_ip': host}}}

def get_ip_from_tfstate(tfstate_filename):
    try:
        tfstate = open(tfstate_filename)
        tfstate_json = json.load(tfstate)
        app_ip = tfstate_json['outputs']['external_ip_address_app']['value']
        db_ip = tfstate_json['outputs']['external_ip_address_db']['value']
        return app_ip, db_ip
    except:
        print("Check tfstate file")

tfstate_filename="/home/amartynov/tmp/test/catalogoanatom_infra/terraform/stage/terraform.tfstate"
#tfstate_filename="/home/amartynov/src/OTUS/catalogoanatom_infra/terraform/stage/terraform.tfstate"
app_ip, db_ip = get_ip_from_tfstate(tfstate_filename)
parser = argparse.ArgumentParser()
parser.add_argument('--list', action='store_true')
parser.add_argument('--host', action='store')
args = parser.parse_args()
if args.list:
    print(json.dumps(my_inventory()))
if args.host:
    print(json.dumps(empty_inv(args.host)))
