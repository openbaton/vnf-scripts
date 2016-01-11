#!/bin/bash

# Copyright (c) 2016 Fraunhofer FOKUS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


# for making sure that the virtual machines are connected to two interfaces

# Create the new cfg file
cat > /etc/network/interfaces.d/eth1.cfg << EOF
auto eth1
iface eth1 inet dhcp
EOF

# Append the source line
echo source /etc/network/interfaces.d/eth1.cfg  >> /etc/network/interfaces

# Now also ifup the interface we created
ifup eth1


