iptables-local:
  iptables.append:
    - chain: INPUT
    - table: filter
    - jump: ACCEPT
    - proto: tcp
    - source: '127.0.0.1'
    - save: True

iptables-established:
  iptables.append:
    - chain: INPUT
    - table: filter
    - jump: ACCEPT
    - match: state
    - proto: tcp
    - connstate: ESTABLISHED
    - save: True

iptables-related:
  iptables.append:
    - chain: INPUT
    - table: filter
    - jump: ACCEPT
    - match: state
    - connstate: RELATED
    - save: True

iptables-ssh:
  iptables.append:
    - chain: INPUT
    - table: filter
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - dport: 22

iptables-ssh-2222:
  iptables.append:
    - chain: INPUT
    - table: filter
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - dport: 2222


iptables-http:
  iptables.append:
    - chain: INPUT
    - table: filter
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - dport: 80
    - save: True

iptables-https:
  iptables.append:
    - chain: INPUT
    - table: filter
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - dport: 443
    - save: True

iptables-drop-all:
  iptables.append:
    - chain: INPUT
    - table: filter
    - jump: DROP
