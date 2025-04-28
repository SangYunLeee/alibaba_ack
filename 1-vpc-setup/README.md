# Alibaba Cloud Infrastructure as Code

이 프로젝트는 Terraform을 사용하여 Alibaba Cloud 인프라를 코드로 관리합니다.

## 생성되는 리소스

### 1. VPC (Virtual Private Cloud)
- VPC 이름: `${var.vpc_name}`
- CIDR 블록: `${var.vpc_cidr}`

### 2. VSwitch
- VSwitch 이름: `${var.vpc_name}-vswitch`
- CIDR 블록: `${var.vswitch_cidrs[0]}`
- 가용 영역: `${var.availability_zones[0]}`

### 3. 보안 그룹
- 보안 그룹 이름: `${var.vpc_name}-sg`
- 보안 그룹 규칙:
  - SSH 접속 (포트 22) 허용
  - 허용 IP: 211.218.18.43/32

## 파일 구조
- `vpc.tf`: VPC 리소스 정의
- `vswitch.tf`: VSwitch 리소스 정의
- `security_group.tf`: 보안 그룹 및 규칙 정의
- `variables.tf`: 변수 선언
- `terraform.tfvars`: 변수 값 설정

## 사용 방법
1. `terraform.tfvars` 파일에 필요한 변수 값을 설정합니다.
2. `terraform init` 명령어로 프로바이더를 초기화합니다.
3. `terraform plan` 명령어로 변경 계획을 확인합니다.
4. `terraform apply` 명령어로 인프라를 생성합니다.

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
aliyun configure
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

## 보안 주의사항

- Access Key와 Secret Key는 절대로 공개 저장소에 커밋하지 마세요.
- 가능한 환경 변수를 사용하여 인증 정보를 관리하세요.
- 프로덕션 환경에서는 더 강력한 보안 조치를 고려하세요. 