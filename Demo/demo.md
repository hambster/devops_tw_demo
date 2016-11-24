# DevOps Taiwan Demo

## Self Introduction

* Name: Wayne Lin
* Email: `hambster@gmail.com`

        A software engineer with passion and enthusiastic.
        Familiar with DevOps, Linux system programming and administration.
        Love coding with golang, C and Python. Manage infra with SaltStack.
        Willing to help people build and deliver systems with high quality.

## Architecture

        +========+      (zeromq)            +========+
        | master | <----------------------- | minion |
        +========+                          +========+
            ^
            |           (zeromq)            +========+
            +------------------------------ | minion |
                                            +========+

## Concept

* Salt `master`: central server to control infrastructure
* Salt `minion`: agent on managed servers

![minions](minion.jpeg)

* Salt `reactor`: receive `event` from `minions`
* Key Concept:
    * infrastructure code
    * `pillar`: custom attributes/label on specific `machine`
    * `grains`: facts about specific `machine`
* Security:
    * `master_sign_pubkey: True` in master config
* manage your `infrastructure`
    * implement stuff your need with `Python` on top of `SaltStack`
* watchout for `upgrade`
    * those guys are `tech geek`
    * if you are `geek` enough, you should try `SaltStack`

## 狀況一、「單一 VM 安裝特定的軟體並設置環境」 (Setup Predefined Packages in Specific Machine)

        salt 'dev-api-*' state.highstate saltenv=dev

## 狀況二、「同時更新數台 Server 的軟體與 config」 (Update OpenSSL on Several Machines)

* highstate on `dev-api-*` or `*`

        {% set centos = True if grains['os'] == 'CentOS' else False %}
        {% set ubuntu = True if grains['os'] == 'Ubuntu' else False %}

        {% if ubuntu %}
          {% set install_method = 'pkg.latest' %}
        {% else %}
          {% set install_method = 'pkg.installed' %}
        {% endif %}

        {%- if centos or ubuntu %}
        openssl:
          {{ install_method }}:
            - name: openssl
        {%- endif %}

## 狀況三、如何管理複雜的配置檔與環境? (How to Manage Configuration for Different Environment)

* 這點 SaltStack 本身就已經設計好. 可以透過 saltenv 搭配 top.sls 做到彈性的機制.
    * `saltenv`

## 狀況四、怎麼解決敏感資料問題? (

* saltstack pillar `in` [Vault from HashiCorp](https://www.vaultproject.io/)
  * https://docs.saltstack.com/en/develop/ref/pillar/all/salt.pillar.vault.html
