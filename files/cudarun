#!/usr/bin/env python3

import argparse
import os


def toggle_discrete(target_state, verbose):
    if verbose:
        print('Attempting to put discrete card into state {}'.format(target_state))

    os.system('bash -c "sudo tee /proc/acpi/bbswitch <<<{} 1> /dev/null"'.format(target_state))

    if verbose:
        with open('/proc/acpi/bbswitch') as f:
            state = f.readline().split(' ')[1].strip()
            print('Discrete card is in state: {}'.format(state))


def load_nvidia_modules(verbose):
    if verbose:
        print('Loading NVIDIA UVM kernel module')

    os.system('sudo modprobe nvidia_uvm')


def execute_command(command, verbose):
    os.environ['LD_LIBRARY_PATH'] = '/usr/lib/nvidia-current:/usr/lib32/nvidia-current'

    if verbose:
        print('Running command: {}'.format(' '.join(command)))
        print('With LD_LIBRARY_PATH={}'.format(os.environ['LD_LIBRARY_PATH']))

    os.system(' '.join(command))


def unload_nvidia_modules(verbose):
    if not verbose:
        os.system('sudo rmmod nvidia_drm nvidia_modeset nvidia_uvm nvidia 1> /dev/null 2>&1')
    else:
        print('Unloading NVIDIA kernel modules')
        os.system('sudo rmmod nvidia_drm nvidia_modeset nvidia_uvm nvidia')


parser = argparse.ArgumentParser()
parser.add_argument('--discrete', '-d', help='Activate a discrete card', action='store_true')
parser.add_argument('--verbose', '-v', help='Print steps', action='store_true')
parser.add_argument('command', nargs=argparse.REMAINDER, help='Command to execute')
args = parser.parse_args()

if args.discrete:
    toggle_discrete('ON', args.verbose)

load_nvidia_modules(args.verbose)
execute_command(args.command, args.verbose)
unload_nvidia_modules(args.verbose)

if args.discrete:
    toggle_discrete('OFF', args.verbose)
