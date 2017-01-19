#!/usr/bin/env th

-- Converts given ascii model to the binary format.

require 'nn'
require 'dpnn'

net = torch.load(arg[1], 'ascii')
torch.save(arg[2], net)
