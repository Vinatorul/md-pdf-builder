# Уровень 2: Основные блоки и команды

Второй уровень организации, основные команды и их структура под каждым вице-президентом.

## Диаграмма

```mermaid
graph TD
    ENG("VP Engineering")
    PRODUCT("VP Product")
    OPS("VP Operations")
    
    ENG --> PLATFORM("Platform Team<br/>Платформа и инфраструктура")
    ENG --> QUALITY("Quality & Tools<br/>Качество и инструменты")
    ENG --> TEAM_MGR("team Managers<br/>Менеджеры витимов")
    
    PRODUCT --> ANALYTICS("Analytics Team<br/>Аналитика")
    PRODUCT --> DESIGN("Design Team<br/>Дизайн")
    PRODUCT --> TEAM_OWNERS("Product Owners<br/>Владельцы витимов")
    
    OPS --> HR("HR Team<br/>Управление персоналом")
    OPS --> FINANCE("Finance Team<br/>Финансы")
    OPS --> INFRA("Infrastructure<br/>Инфраструктура")
    
    style ENG fill:none,stroke:#333
    style PRODUCT fill:none,stroke:#333
    style OPS fill:none,stroke:#333
    style PLATFORM fill:none,stroke:#333
    style QUALITY fill:none,stroke:#333
    style TEAM_MGR fill:none,stroke:#333
    style ANALYTICS fill:none,stroke:#333
    style DESIGN fill:none,stroke:#333
    style TEAM_OWNERS fill:none,stroke:#333
    style HR fill:none,stroke:#333
    style FINANCE fill:none,stroke:#333
    style INFRA fill:none,stroke:#333
```

## Описание команд

### Engineering блок

#### Platform Team — Платформа и инфраструктура

- **Ответственность:** Архитектура, библиотеки, DevOps
- **Численность:** TBD

#### Quality & Tools — Качество и инструменты

- **Ответственность:** Автоматизация, практики качества, AI-тулинг
- **Численность:** TBD

#### team Managers — Менеджеры витимов

- **Ответственность:** Управление витимами, delivery, развитие

### Product блок

#### Analytics Team — Аналитика

- **Ответственность:** Данные, метрики, insights
- **Численность:** TBD

#### Design Team — Дизайн

- **Ответственность:** UX/UI, дизайн-система, исследования
- **Численность:** TBD

#### Product Owners — Владельцы витимов

- **Ответственность:** Приоритизация, требования, стейкхолдеры

### Operations блок

#### HR Team — Управление персоналом

- **Ответственность:** Найм, развитие, компенсация
- **Численность:** TBD

#### Finance Team — Финансы

- **Ответственность:** Бюджетирование, планирование, отчётность
- **Численность:** TBD

#### Infrastructure — Инфраструктура

- **Ответственность:** IT-инфраструктура, безопасность, сети
- **Численность:** TBD
