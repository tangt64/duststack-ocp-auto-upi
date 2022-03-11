# OCP UPI ANSIBLE INSTALLER 
## _좀 더 쉽게 설치 그리고 사용!_

이 플레이북은 OCP설치를 좀 더 쉽게 도와주는 도구 입니다. 현재는 다음만 지원하고 있습니다.
- libvirtd

추후 다음 기반으로 설치 지원 예정입니다.
- openstack
- vSphere
- RHV

## 추가기능

```sh
$ ansible-galaxy collection install containers.podman
```

## 기능

플레이북 기반으로 빠르게 가상머신 생성 및 오픈 시프트 설치를 도와주는 도구 입니다. 현재는 libvirt만 지원하기 때문에 PoC용도로 적절합니다. 최종적으로 실무 환경에서 설치가 가능하도록 기능을 지원할 예정 입니다.

__공식 설치 도구가 아니니, 사용에 관련된 문제는 사용자가 직접 해결해야 합니다.__

## 설치

설치시 다음과 같은 내용이 필요 합니다.
1. RHN/Quay 네트워크 아이디
2. "Pull Secret" JSON 파일

다음과 같은 부분만 편집하면 바로 설치가 가능 합니다.
- group_vars/lab
- pull_secret

실행은 다음같이 합니다.

```sh
$ ansible-playbook playbook/build-lab.yaml
```
더 자세한 내용은 다음에 더 추가하도록 하겠습니다.
