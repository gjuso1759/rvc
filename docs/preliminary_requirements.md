# Preliminary Requirements

## Robot Vacuum Cleaner (RVC) SW Controller

- An RVC automatically cleans and mops household surface.
- It goes straight forward while cleaning.
- If its sensors found an obstacle, it stops cleaning, turns aside left or right, and goes forward with cleaning.
- If there are obstacles in both front, left and right, it move backward and turn aside left or right, and goes forward.
- If it detects dust, power up the cleaning for a while.
- We do not consider the detail design and implementation on HW controls.
- We only focus on the automatic cleaning function.

---

## Clarified Requirements

The following clarifications were provided before DFD construction. They refine the
statements above and are binding for all Structured Analysis artifacts.

### 1. Sensor Interface

- The **front sensor** is delivered as an **interrupt**.
- The **left sensor**, **right sensor**, and **dust sensor** are delivered **periodically**.
- All sensor values are **boolean**.
- Sensor values arrive continuously while the system is running.

### 2. Timing

- The **tick** is internal to the RVC controller.
- **Turning** runs for **3 ticks**.
- **Dust cleaning (`clean_up`)** runs for **3 ticks**.
  The 3-tick limit exists because boosted cleaning must not run indefinitely once triggered.
- **Backward movement** is not tick-limited; it continues **until the left or right side
  becomes free**.

### 3. Turn Direction Priority

- When both a left turn and a right turn are possible, the **left turn takes priority**.

### 4. Cleaner Modes

The cleaner has exactly three modes:

| Mode | Meaning |
| --- | --- |
| `clean_off` | Cleaning disabled |
| `clean_on` | Normal cleaning |
| `clean_up` | Boosted cleaning (dust detected) |

- The cleaner is `clean_off` **only while moving backward and while turning**.

### 5. Behavior Rules

- **Forward with cleaning** is the default behavior; the cleaner is `clean_on`.
- **Dust detected while moving forward** → enter `clean_up` for 3 ticks.
- **Obstacle detected while in `clean_up`** → the RVC **stops in place** and keeps
  cleaning until the dust is gone (bounded by the 3-tick limit), then proceeds with
  obstacle handling.
- **Obstacle in front only** → stop cleaning, turn aside (left preferred), then go
  forward with cleaning.
- **Obstacles in front, left and right** → move backward until the left or right side is
  free, then turn aside and go forward.
- **Dust detected while moving backward** → clean in place, then resume moving backward.
- **Dust detected while turning** → finish the turn first, then clean the dust.
- **After completing a turn**, the front is expected to be clear, so the RVC moves
  forward in the `clean_up` state.

### 6. Scope

- Detailed design and implementation of hardware controls are **out of scope**.
- Only the **automatic cleaning function** is in scope.

---

## External Entities

| Entity | Direction | Data |
| --- | --- | --- |
| Front Sensor | Input | Front Sensor Input (boolean, interrupt) |
| Left Sensor | Input | Left Sensor Input (boolean, periodic) |
| Right Sensor | Input | Right Sensor Input (boolean, periodic) |
| Dust Sensor | Input | Dust Sensor Input (boolean, periodic) |
| Motor | Output | Direction |
| Cleaner | Output | Clean (mode) |

---

## Open Questions

- None recorded at this time. Record any ambiguity here rather than assuming an answer.
