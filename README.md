# Alibaba Cloud VPC Terraform 프로젝트

이 프로젝트는 Terraform을 사용하여 Alibaba Cloud에 VPC와 VSwitch를 생성하는 인프라스트럭처 코드입니다.

## 프로젝트 구조

```
.
├── main.tf          # 주요 리소스 정의 (VPC, VSwitch)
├── variables.tf     # 변수 정의
├── outputs.tf       # 출력값 정의
├── provider.tf      # Alibaba Cloud 프로바이더 설정
└── README.md        # 프로젝트 문서
```

## 사전 요구사항

- [Terraform](https://www.terraform.io/downloads.html) 설치
- Alibaba Cloud 계정
- Alibaba Cloud Access Key와 Secret Key

```
brew install aliyun-cli

# 설치 확인
aliyun --version
aliyun configur
```
## 설정 방법

### 1. 인증 정보 설정

다음 두 가지 방법 중 하나로 Alibaba Cloud 인증 정보를 설정할 수 있습니다:

#### 방법 1: 환경 변수 사용 (권장)
```bash
export ALICLOUD_ACCESS_KEY="your-access-key"
export ALICLOUD_SECRET_KEY="your-secret-key"
```

#### 방법 2: provider.tf 파일에 직접 설정
`provider.tf` 파일을 수정하여 직접 입력:
```hcl
provider "alicloud" {
  access_key = "your-access-key"
  secret_key = "your-secret-key"
  region     = "ap-northeast-1"
}
```

### 2. 변수 설정 (선택사항)

`variables.tf` 파일에서 다음 변수들의 기본값을 수정할 수 있습니다:
- `vpc_name`: VPC 이름
- `vpc_cidr`: VPC CIDR 블록
- `vswitch_cidrs`: VSwitch CIDR 블록 목록
- `availability_zones`: 가용 영역 목록

## 사용 방법

1. Terraform 초기화
```bash
terraform init
```

2. 실행 계획 확인
```bash
terraform plan
```

3. 인프라스트럭처 적용
```bash
terraform apply
```

4. 인프라스트럭처 삭제
```bash
terraform destroy
```

## 생성되는 리소스

- 1개의 VPC (CIDR: 10.0.0.0/16)
- 2개의 VSwitch
  - VSwitch 1: 10.0.1.0/24 (ap-northeast-1a)
  - VSwitch 2: 10.0.2.0/24 (ap-northeast-1b)

## 출력값

- `vpc_id`: 생성된 VPC의 ID
- `vswitch_ids`: 생성된 VSwitch들의 ID
- `vpc_cidr`: VPC의 CIDR 블록

## 보안 주의사항

- Access Key와 Secret Key는 절대로 공개 저장소에 커밋하지 마세요.
- 가능한 환경 변수를 사용하여 인증 정보를 관리하세요.
- 프로덕션 환경에서는 더 강력한 보안 조치를 고려하세요. 