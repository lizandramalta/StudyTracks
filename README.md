## StudyTracks — Gerencie trilhas de estudo e sessões

**StudyTracks** é um app exemplo em SwiftUI que permite:

- Criar, listar e editar **trilhas de aprendizagem** (Learning Tracks)
- Registrar **sessões de estudo** com duração, data e nota de esforço
- Calcular **progresso** de cada trilha com base em um **método de pontuação** selecionado por trilha
- **Agendar** próxima sessão com regras diferentes (ex.: espaçamento fixo vs. baseado em desempenho)
- **Exportar** dados em formatos distintos (CSV/JSON) para planilhas ou outras ferramentas

> O projeto **não usa Strategy**. Em vez disso, concentra decisões em `switch`/`if` dentro de serviços. Sua tarefa é identificar pontos de variação e refatorar.

#### O que considerar ao analisar Strategy

- **ProgressService**: hoje há um `switch` em `ScoringMethod` para calcular progresso. Refatore para estratégias de pontuação independentes (ex.: `TimeWeightedScoring`, `CompletionRatioScoring`, `SpacedRepetitionScoring`).
- **SchedulingService**: troca o algoritmo de **agendamento**. Avalie estratégias como `FixedIntervalScheduling` e `PerformanceAdaptiveScheduling`.
- **ExportService**: muda a serialização para **CSV** e **JSON**; pense em `Exporter` por formato.
- Evite _over-engineering_: nem todo `switch` merece Strategy. Valide se há **variação que tende a crescer** ou precisa ser **selecionável em runtime**.
