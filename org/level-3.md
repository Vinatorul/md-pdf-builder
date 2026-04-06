# Уровень 3: Витимы и специализированные команды

Третий уровень организации, продуктовые витимы и специализированные команды.

## Диаграмма

```mermaid
graph TD
    TEAM_MGR("team Managers")
    TEAM_OWNERS("Product Owners")
    QUALITY("Quality & Tools")
    
    TEAM_MGR --> V1("team 1<br/>Team Lead + Engineers")
    TEAM_MGR --> V2("team 2<br/>Team Lead + Engineers")
    TEAM_MGR --> VN("team N<br/>Team Lead + Engineers")
    TEAM_MGR --> TOOLS("Tools & Efficiency<br/>AI-тулинг и практики")
    
    TEAM_OWNERS --> PO1("PO team 1")
    TEAM_OWNERS --> PO2("PO team 2")
    TEAM_OWNERS --> PON("PO team N")
    
    QUALITY --> QA_TEAM("QA Engineers<br/>Автоматизация тестов")
    QUALITY --> TOOLS
    
    style TEAM_MGR fill:none,stroke:#333
    style TEAM_OWNERS fill:none,stroke:#333
    style QUALITY fill:none,stroke:#333
    style V1 fill:none,stroke:#333
    style V2 fill:none,stroke:#333
    style VN fill:none,stroke:#333
    style TOOLS fill:none,stroke:#333
    style PO1 fill:none,stroke:#333
    style PO2 fill:none,stroke:#333
    style PON fill:none,stroke:#333
    style QA_TEAM fill:none,stroke:#333
```

## Описание витимов и команд

### Продуктовые витимы

#### Типовая структура витима

**team N — [Название продукта]**

- **Ответственность:** Разработка, тестирование, production, поддержка
- **Типовой состав:**
  - Team Lead (инженер)
  - Инженеры (mix BE, FE, full-stack)
  - Product Owner
  - Поддержка от QA и Platform

### Специализированные команды

#### Tools & Efficiency — Инструменты и эффективность

- **Ответственность:** AI-тулинг, инструменты, практики, распространение
- **Численность:** TBD

#### QA Engineers — Инженеры качества

- **Ответственность:** Автоматизация, инфраструктура тестов, shift-left
- **Численность:** TBD

