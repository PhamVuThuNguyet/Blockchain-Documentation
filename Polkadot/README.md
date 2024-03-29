# Consensus

## Proof of Stake (PoS)

### Proof of Stake là gì?

Proof of Stake (PoS) là một thuật toán đồng thuận cho phép người dùng kiếm được phần thưởng (rewards) từ việc xác thực các khối trên blockchain.

Trong PoW, để có thể trở thành validator thì người dùng cần dựa vào sức mạnh phần cứng của mình. Điều này đòi hỏi người dùng đầu tư các phần cứng mining đắt tiền và tiêu thụ lượng điện lớn.

Ngược lại, PoS hoạt động bằng cách chọn ngẫu nhiên validator dựa trên số lượng token mà họ đặt cược (stake). Lượng locked token càng nhiều, khả năng được chọn làm validator càng lớn. Nếu validate sai thì người dùng phải chịu phạt là mất đi hết số lượng token đó.

### Ưu điểm

- Không đòi hỏi máy cấu hình cao, bất kỳ ai cũng có thể thiết lập các node chuyên biệt trên máy tính hoặc máy chủ (server) của riêng mình.
- Đôi khi có thể uỷ quyền (delegate) cho validator, nghĩa là người dùng gửi token cho validator để họ có thêm quyền vote, đổi lại người gửi cũng nhận được một phần phần thưởng mà không phải làm gì.
- Tăng khả năng mở rộng và tốc độ giao dịch, cải thiện tính phân quyền vì việc validate có thể được thực hiện bởi bất cứ ai staking token trong mạng, tạo ra một mạng lưới phi tập trung.
- Proof of Stake tiết kiệm tài nguyên và thân thiện với môi trường hơn, không đòi hỏi tiêu thụ nhiều điện để hoạt động như Proof of Work.

### Nhược điểm

- Khi đã trở thành validator, người dùng sẽ được nhận thưởng từ việc xác thực, nhưng bị giảm vốn. Đôi khi sẽ bị thâm hụt mất phần đã stake ban đầu.
- Sẽ có trường hợp unlock cần phải đợi một khoảng thời gian. Điều này sẽ làm người dùng bị động khi giá token điều chỉnh. Ví dụ như LUNA unstake trên Terra Station tốn 15 ngày.
- Việc khóa (stake) token này liên quan đến quản trị. Điều này dẫn đến trường hợp blockchain mang tính tập trung: Một số ít người nắm nhiều token, quyền hạn quá lớn, gây ra sự domination trong các quyết định.
- Tính bảo mật kém vì ai cũng có thể trở thành validator chỉ bằng cách sở hữu lượng lớn token, khiến mạng dễ bị tấn công 51%. Ngoài ra, những validators này cũng có cơ hội lạm dụng quyền lực của mình.

## Nominated Proof of Stake (NPoS)

Để giải quyết những nhược điểm của PoS, NPoS ra đời.
NPoS là nơi mà các stakeholder có quyền chọn những validator cụ thể để tham gia vào cơ chế đồng thuận. Trong NPoS, có 2 role là <b>validators</b> (trình xác thực) và <b>nominators</b> (trình đề cử). Trong NPoS, người dùng được khuyến khích tham gia vào việc bảo vệ mạng lưới bằng cách staking token và biểu quyết để chọn ra validators có lịch sử hoạt động tốt. Chỉ các nút đã được đề cử mới được phép xác nhận các khối mới và kiếm phần thưởng.

![Nominated Proof of Stake](../imgs/NPoS.png)

<h4>CÁCH HOẠT ĐỘNG CỦA NPoS</h4>
Định kỳ vài lần trong ngày, hệ thống sẽ chọn ra một nhóm các node được gọi là các validator. Chúng sẽ đóng vai trò quan trọng trong các giao thức như sản xuất khối (block production), validating parachain blocks, đảm bảo tính bất biến (finality).

- Nhóm validator sẽ phải stake token theo dạng thế chấp, cam kết hoàn thành đúng nhiệm vụ. Bất kì hành động nào gây tổn hại đến giao thức, số token được stake sẽ bị cắt đi một phần (1% lượng stake trong Polkadot). Ngược lại, nếu hoàn thành tốt, họ sẽ được thưởng. Tất cả các validator đều có trọng số như nhau (quyền biểu quyết như nhau) trong quá trình xác thực.

- Các nominator cũng sẽ lock token chung với validator mà họ bầu chọn và nhận thưởng theo tỉ lệ token họ đóng góp (pro rata). Ngược lại khi validator của họ không hoàn thành đúng nhiệm vụ hoặc gây tổn hại đến giao thức, họ cũng sẽ bị cắt một phần token trong pool. Staked token của nominator được phân phối cho những validators mà họ lựa chọn sao cho càng đồng đều càng tốt.

![NPoS architecture](../imgs/NPoS%202.png)

Cơ chế này khiến cho các bên có ý đồ xấu rất khó để có được sự bầu chọn từ nominator (vì cần phải xây dựng một lượng lớn danh tiếng để có được sự ủng hộ) và sẽ rất tốn kém để tấn công hệ thống (bởi cuộc tấn công nào cũng sẽ dẫn đến việc cắt giảm một lượng lớn DOT).

Polkadot sử dụng các công cụ từ lý thuyết bầu cử (election theory) đến lý thuyết trò chơi (game theory) để tối ưu hóa rời rạc, nhằm phát triển một quy trình bầu chọn hiệu quả mang lại sự đại diện công bằng (fair representaion) và bảo mật.

## NPoS Election algorithms

Trong Polkadot, các validators sẽ có quyền gần như ngang nhau, nên điều quan trọng là phải đảm bảo số lượng staked token của mỗi validator được phân bố đồng đều, hay nói cách khác số lượng staked token của mỗi nominator cần được phân bố tới các validator mà họ chọn càng đồng đều càng tốt. Polkadot sử dụng một thuật toán bầu cử (election algorithm) để tối ưu hoá 3 tham số khi tính toán solution graph của nominators và validators:

- Maximize tổng số token at stake (số token sẽ mất nếu validate sai)
- Maximize staked token của validator đang có stake thấp nhất
- Minimize phương sai (variance) của stake trong set

Sequential Phragmén, Phragmms, và Star balancing là một số thuật toán đáng chú ý mà Polkadot sử dụng. Tìm hiểu thêm tại <a href = "https://arxiv.org/abs/2004.12990">đây</a>

### Sequential Phragmén

Vào cuối thế kỷ 19, nhà toán học Thụy Điển Lars Edvard Phragmén đã đề xuất một phương pháp để bầu các thành viên vào quốc hội trong nước. Ông nhận thấy rằng những phương pháp bầu cử thời điểm đó có xu hướng nhường tất cả các ghế cho chính đảng phổ biến nhất.

Ngược lại, phương pháp mới của ông đảm bảo rằng số ghế được ấn định cho mỗi đảng tỷ lệ thuận với số phiếu được trao cho họ, vì vậy nó giúp mang lại nhiều sự đại diện hơn cho bên thiểu số. Quy tắc này có thể tạm hiểu rằng bất kỳ nominator nào nắm giữ ít nhất 1/n tổng số stake đều được đảm bảo có ít nhất một trong số những validator của họ được chọn.

![Fair representation](../imgs/Phragmen.webp)

Ngoài ra chúng ta cần phân bố staked token sao cho cân bằng nhất có thể.

![Security](../imgs/Phragmen%202.webp)

Polkadot sử dụng sequential Phragmén trong quá trình lựa chọn validator (validator election) và lựa chọn council (council election). Khi lựa chọn council member, người dùng có thể chọn tối đa 16 ứng viên (candidates) và khóa một lượng token (reserved bond / reserved token) làm trọng số. Phragmén sẽ chạy một lần vào mỗi election để xác định top candidates và một lần nữa giữa các top candidates này để cân bằng trọng số vote của họ.

#### Phragmén Algorithm

_Tham khảo thêm tại <a href = "https://ojs.aaai.org/index.php/AAAI/article/view/10598">đây</a> và tại <a href = "https://arxiv.org/pdf/1611.08826.pdf">đây</a>_

Thuật toán Phragmén sẽ chọn ra một candidate trong mỗi lần chạy, lặp đi lặp lại đến khi chọn đủ:

1. Voter (nominator) gửi lá phiếu (ballot), đánh dấu những candidates mà họ chọn.
2. Initial cost của mỗi ballot là 0
3. Giả sử candidate được lựa chọn có _n_ ballot, candidate này sẽ bị cộng thêm _1/n_ vào cost.
4. Candidate được chọn là người mà mean cost của những ballot ủng hộ họ nhỏ nhất.
5. Cập nhật cost của tất cả ballots đã vote cho winner của vòng này.
6. Quay lại từ bước 3 cho tới khi chọn đủ

<b>Ví dụ:</b>

```
Open Seats: 3

Candidates:   A B C D  L0
-------------------------
Voter V1:       X      0
Voter V2:         X X  0
Voter V3:       X   X  0
Voter V4:     X X      0
Voter V5:       X X X  0
```

Trong round 1, vì initial cost đều bằng 0 nên candidate được lựa chọn là người có số vote cao nhất (1/n nhỏ nhất).

```
Filled seats: 1 (B)
Open Seats: 2

Candidates:   A B C D  L0 L1
-----------------------------
Voter V1:       X      0  1/4
Voter V2:         X X  0  0
Voter V3:       X   X  0  1/4
Voter V4:     X X      0  1/4
Voter V5:       X X X  0  1/4
```

Tiếp tục xét A, C, D:

- Có 1 ballot vote cho A, với cost 1/4
- Có 2 ballot vote cho C, với cost 0 + 1/4
- Có 3 ballot vote cho D, với cost 0 + 1/4 + 1/4

Nếu:

- A win, cost = (1/4 + 1/1) / 1 = 5/4
- C win, cost = (0 + 1/4 + 1/2) / 2 = 5/8
- D win, cost = (0 + 1/4 + 1/4 + 1/3) / 3 = 1/2

Vì 1/2 nhỏ nhất nên D được chọn ở vòng này.

```
Filled seats: 2 (B, D)
Open Seats: 1

Candidates:   A B C D  L0 L1  L2
---------------------------------
Voter V1:       X      0  1/4 1/4
Voter V2:         X X  0  0   1/2
Voter V3:       X   X  0  1/4 1/2
Voter V4:     X X      0  1/4 1/4
Voter V5:       X X X  0  1/4 1/2
```

Tương tự như trên, C được chọn trong vòng cuối.

```
Filled seats: 3 (B, D, C)
Open Seats: 0

Candidates:   A B C D  L0 L1  L2  L3
------------------------------------
Voter V1:       X      0  1/4 1/4 1/4
Voter V2:         X X  0  0   1/2 1
Voter V3:       X   X  0  1/4 1/2 1/2
Voter V4:     X X      0  1/4 1/4 1/4
Voter V5:       X X X  0  1/4 1/2 1
```

_Insight: Tổng cost của các ballot luôn bằng số candidate đã chọn tính tới round đó_

#### Weighted Phragmén

Trong ví dụ trên, chúng ta xem tất cả các voter đều có trọng số ngang nhau. Tuy nhiên trong Polkadot, ballot được gán trọng số bằng số lượng token của mỗi voter (nominator).

Weighted Phragmén cũng hoạt động tương tự như trên, tuy nhiên có thêm tính năng để phân bổ trọng số (stake) của các candidates (validators).

1. Khởi tạo danh sách các nominators, lượng staked token của họ, và danh sách validators họ support.
2. Khởi tạo đồ thị có trọng số (edge-weighted graph) mapping giữa nominators và validators, trong đó trọng số của mỗi edge là tổng _potential weight_ (staked token) của nominator đó. Tổng của tất cả các potential weight cho một validator được gọi là _approval stake_.
3. Initial score của mỗi validator bằng `1/approval_stake`
4. Với mỗi nominator, update score của validator mà họ support bằng cách cộng thêm một lượng `(total_budget * nominator_cost) / approval_stake`
5. Lựa chọn validator có score nhỏ nhất.
6. Cập nhật trọng số của mỗi edge kết nối tới validator đã chọn `score - nominator_load`, và cập nhật `nominator_cost=score`
7. Quay lại bước 4 cho tới khi chọn đủ
8. Tính backing stake của mỗi candidate bằng tổng các backing stake mà voter phân bố cho candidate đó `budget * edge_weight / nominator_cost`

<b> Ví dụ: </b>

```
Filled seats: 0
Open Seats: 3

Candidates:    A B C D E  L0
----------------------------
Voter V1 (1):  X X        0
Voter V2 (2):  X X        0
Voter V3 (3):  X          0
Voter V4 (4):    X X X    0
Voter V5 (5):  X     X    0
```

Tính approval stake cho mỗi candidate.

```
Candidate A: 1 + 2 + 3 + 5 = 11
Candidate B: 1 + 2 + 4 = 7
Candidate C: 4 = 4
Candidate D: 4 + 5 = 9
Candidate E: 0
```

E không có vote nào nên không cần phải xem xét. Tiếp theo tính initial score của các candidate.

```
Candidate A: 1 / 11 = 0.091
Candidate B: 1 / 7 = 0.143
Candidate C: 1 / 4 = 0.25
Candidate D: 1 / 9 = 0.111
Candidate E: N/A
```

Tiếp theo là update score của mỗi candidate. Tuy nhiên trong round đầu, initial cost của voter đều là 0 nên chúng ta đơn giản lựa chọn candidate có initial score thấp nhất.

Tất cả những edge kết nối đến A lúc này phải được cập nhật trọng số.

```
Edge(Voter -> A) = 0.091
```

Cost của voter cũng được cập nhật.

```
Filled seats: 1 (A)
Open Seats: 2

Candidates:    A B C D E  L0 L1
----------------------------------
Voter V1 (1):  X X        0  0.091
Voter V2 (2):  X X        0  0.091
Voter V3 (3):  X          0  0.091
Voter V4 (4):    X X X    0  0
Voter V5 (5):  X     X    0  0.091
```

Quay trở lại lựa chọn các candidates tiếp theo.

```
Candidate B: 0.182
Candidate C: 0.25
Candidate D: 0.162
```

Trong round này, chúng ta lựa chọn D.

```
Filled seats: 2 (A, D)
Open Seats: 1

Candidates:    A B C D E  L0 L1    L2
-----------------------------------
Voter V1 (1):  X X        0  0.091 0.091
Voter V2 (2):  X X        0  0.091 0.091
Voter V3 (3):  X          0  0.091 0.091
Voter V4 (4):    X X X    0  0     0.162
Voter V5 (5):  X     X    0  0.091 0.162
```

Tương tự, round cuối chọn B

```
Filled seats: 3 (A, D, B)
Open Seats: 0

Candidates:    A B C D E  L0 L1    L2    L3
------------------------------------------
Voter V1 (1):  X X        0  0.091 0.091 0.274
Voter V2 (2):  X X        0  0.091 0.091 0.274
Voter V3 (3):  X          0  0.091 0.091 0.091
Voter V4 (4):    X X X    0  0     0.162 0.274
Voter V5 (5):  X     X    0  0.091 0.162 0.162
```

Bây giờ chúng ta cần xác định số stake mà voter nên phân bổ tới các candidate. Ta có trọng số các edge:

```
Nominator: V1
    Edge to A weight= 0.091
    Edge to B weight= 0.183
Nominator: V2
    Edge to A weight= 0.091
    Edge to B weight= 0.183
Nominator: V3
    Edge to A weight= 0.091
Nominator: V4
    Edge to B weight= 0.113
    Edge to D weight= 0.162
Nominator: V5
    Edge to A weight= 0.091
    Edge to D weight= 0.071
```

Ví dụ với nominator V1 và validator A

```
backing_stake (A) = 1 * 0.091 / 0.274 = 0.332
```

Tương tự ta có kết quả cuối cùng

```
A is elected with stake 6.807.
D is elected with stake 4.545.
B is elected with stake 3.647.

V1 supports: A with stake: 0.332 and B with stake: 0.668.
V2 supports: A with stake: 0.663 and B with stake: 1.337.
V3 supports: A with stake: 3.0.
V4 supports: B with stake: 1.642 and D with stake: 2.358.
V5 supports: A with stake: 2.813 and D with stake: 2.187.
```

### Phragmms (aka Balphragmms)

Phragmms là một election rule mới được đặt tên dựa theo thuật toán Phragmén, được sử dụng trong Kusama và Polkadot. Nó xem xét 2 mục tiêu khi lựa chọn validator:

- Đảm bảo proportional representation (proportional justified representation - PJR)

Phragmms là một election rule mới được đặt tên dựa theo thuật toán Phragmén, được sử dụng trong Kusama và Polkadot. Nó xem xét 2 mục tiêu khi lựa chọn validator:

- Đảm bảo proportional representation (proportional justified representation - PJR)
- Tối đa hóa và phân bố đồng đều backing stake (stake supports) của validators nhất có thể.

Trong Polkadot, maximin support objective là tối đa hóa lượng backing stake nhỏ nhất của các validators. Tìm hiểu thêm tại <a href = "https://arxiv.org/pdf/2004.12990.pdf"> đây </a>

Cách hoạt động của thuật toán Phragmms:

1. Khởi tạo committee A trống và edge weight vector w = 0
2. Lặp lại 2 bước sau cho đến khi chọn đủ committee:
   - Tìm unelected candidate có score cao nhất, thêm vào A
   - Re-balance w
   - Re-balance w
3. Trả về A và w

### Computing a balanced solution

Phần này hướng đến việc thiết kế một thuật toán tối ưu để assign nominators' stake tới các validators. Có 2 hướng để giải quyết bài toán balancing là <i>parametric flow algorithms</i> và <i>star balancing heuristic</i>.

#### Notation

> Note: Đồ thị lưỡng phân là một đồ thị đặc biệt, trong đó tập các đỉnh có thể được chia thành hai tập không giao nhau thỏa mãn điều kiện không có cạnh nối hai đỉnh bất kỳ thuộc cùng một tập.

Xét một ví dụ NPoS gồm một đồ thị lưỡng phân $(N \cup A, E)$, trong đó $N$ là set các nominators, $A$ là set các elected validators (committee) size $k$, với $k \coloneqq \lvert A \rvert \ll \lvert N \rvert$, tồn tại cạnh $nv \in E$ khi nominator $n$ ủng hộ (approve) cho validator $v \in A$.

Cho vector nominator stakes $s \in R_{\geq 0}^N$, trong đó $s_n$ là stake của nominator $n$.

Một edge weight vector hợp lý $w \in R_{\geq 0}^N$ phải có tất cả các phần tử không âm (component-wise non-negative) và thỏa mãn điều kiện: $\sum_{v \in A: nv \in E}{w_{nv} \leq s_n}$ với mỗi nominator $n \in N$. $w$ được coi là "tight" nếu bất đẳng thức trên "tight" với tất cả các nominator có ít nhất một neighbour valivator trong $A$.

> Note: An inequality is tight if there is some choice of the variables involved for which equality holds. Otherwise it is not.

> Note: Nếu G là đồ thị vô hướng không có khuyên (cạnh nối một đỉnh với chính nó), ma trận liên thuộc (hay liên kết đỉnh cạnh) của đồ thị G, ký hiệu A(G), là ma trận n\*m (n: số đỉnh, m: số cạnh) được định nghĩa là A = ($A_{ij}$) với quy ước: $A_{ij}$ = 1 nếu đỉnh i kề với cạnh j, $A_{ij}$ = 0 nếu ngược lại.

Gọi $B \in {0, 1}^{A \times E}$ là ma trận liên thuộc cho validator set $A$. Với bất kỳ $w \in R_{\geq 0}^E$, tổng support mà $w$ assign cho mỗi validator được thể hiện bằng vector $supp_w(v) = (Bw)_v = \sum_{n \in N: nv \in E}{w_{nv}}$.

Nhiệm vụ cần giải quyết trong bài toán balancing là tìm một tight vector $w$ để tối thiểu hóa $l_2$ norm của support vector, hay nói cách khác, cần tối thiểu giá trị: $$val(w) \coloneqq \Vert supp_w \Vert_2 = \Vert Bw \Vert_2$$

#### The star balancing heuristic

Star balancing là một thuật toán tổ hợp ngẫu nhiên.

> Theorem: Với bất kỳ hằng số $\epsilon, \delta > 0$, thuật toán star balancing trả về một tight weight vector $w$ với giá trị $val(w)$ có xác suất ít nhất $(1- \delta)$

Chi tiết thuật toán:

Xét $(N \cup A, E, s)$. Với mỗi nominator $n \in N$, gọi $A_n \subseteq A$ là set các neighbors của nó trong $A$.

## Hybrid consensus

Sự đồng thuận trong blockchain chủ yếu diễn ra ở hai họat động: tạo khối và hoàn thiện chuỗi (block creation và chain finalization). Hai hoạt động này không tách biệt nhau trong mạng.

1. Nhược điểm của hoạt động block creation và chain finalization

- Chain Creation:
  - PoW: Tiêu thụ năng lượng điện cao, tiêu tốn nhiều tài nguyên phần cứng …
  - PoS, DPoS: Mạng có thể bị tấn công nếu nhiều validator cố tình làm sai, hoặc validator bị điều khiển.
- Chain finalization:
  - Không có mốc thời gian cụ thể là khi nào chain sẽ được xác nhận cuối cùng (finalization)
  - Về lý thuyết blockchain ledger có thể bị sửa đổi sau nhiều năm

2. Polkadot đã làm gì để khác biệt ?
   Ý tưởng của họ là tách 2 quá trình block creation và chain finalization

- Block creation (hay block authoriation) sử dụng BABE (Blind Assigment for Blockchain Extention)

* Chain finalization sử dụng GRANPA

=> Có thể nói Polkadot dùng BABE và GRANPA để tạo ra một dạng Hybrid Consensus nhằm tối ưu hóa việc block creation và chain finalization.
Xem thêm tại <a href = "https://www.youtube.com/watch?v=1CuTSluL7v4&t=4s">đây</a>

## BABE

BABE là một thuật toán dựa trên slot.

- Để tạo ra một block cần một khoảng thời gian, khoảng thời gian đó gọi là epoch, Polkadot chia thành nhiều epoch, trong mỗi epoch lại chia làm nhiều slot, một slot khoảng 6s, cứ 6 giây này có 1 block được tạo ra.
- Đầu mỗi epoch tập hợp các validators được lựa chọn, các validator đó sẽ làm việc trong suốt epoch tiếp theo. Tương tự, vào đầu slot cũng có những validator được lựa chọn để làm việc trong slot tiếp.

Làm như nào để chọn được validator làm việc trong 1 slot nhất định ?

- Phương pháp đơn gian nhất là round-robin: kiểu chọn xoay vòng, lần này người này làm thì lần sau đến người tiếp theo. Tuy nhiên, nhược điểm là coordinate attack vì validator làm việc trong slot tiếp theo sẽ được biết trước.
- Sau đó họ khắc phục bằng phương pháp Blind Assignment thông qua lựa chọn ngẫu nhiên.

BABE (Blind Assignment for Blockchain Extension protocol) là một cơ chế block production chạy giữa các validators và xác định author của block mới. BABE phân bổ các block production slot cho validator dựa trên số lượng DOT mà họ đã đặt cược, sử dụng randomness cycle tương tự như thuật toán đồng thuận Ouroboros Praos. Nói tóm gọn, mỗi block producers sẽ có VRF key được regist với số lượng locked token của họ.

### Randomness

Tính ngẫu nhiên trong PoS blockchain rất quan trọng vì chúng ta cần phân bố validator responsibilities một cách công bằng và không thể dự đoán trước. Tuy nhiên những hàm sinh số ngẫu nhiên mà chúng ta thường gặp trong lập trình không thực sự là ngẫu nhiên. Nó chỉ là "Pseudo-random", nghĩa là chúng phụ thuộc vào một _seed_ "đủ ngẫu nhiên". Với cùng một seed, chúng ta sẽ luôn thu được cùng một đầu ra. Tuy nhiên trong thực tế, đầu vào của chúng ta thay đổi liên tục khiến cho việc get same result cho tất cả các nodes trong blockchain gần như bất khả thi.

Đối với blockchain, có 2 hướng tiếp cận chính cho bài toán randomness là: RANDAO và VRF. Polkadot và Kusama đều sử dụng VRF.

### VRF

VRF (Verifiable random function) là một phép toán nhận input và generate ra output ngẫu nhiên cùng bằng chứng xác thực submitter.

Chi tiết cách hoạt động:

- Slots có độ dài 6 giây
- Mỗi slot có thể chứa 1 block hoặc không
- 2400 slots tạo thành epoch -> 1 epoch kéo dài 4hrs.
- Trong 1 slot, mỗi validator sẽ "roll" bằng cách thực hiện một function (VRF) với input:

  - "Secret key": Key được generate riêng cho roll này
  - Epoch randomness value: hash của VRF value từ block trong epoch gần cuối (N - 2), vì vậy tính ngẫu nhiên trong quá khứ sẽ ảnh hưởng đến tính ngẫu nhiên ở hiện tại (N).
  - Slot number

- Output gồm 2 value: RESULT (random value) và PROOF (bằng chứng cho thấy RESULT được generate đúng).
- RESULT được so sánh với một _threshold_, nếu RESULT < threshold thì validator đã roll value trở thành candidate để produce block cho slot đó. Validator sau đó sẽ cố gắng tạo block mới và submit block đó lên network cùng với RESULT và PROOF đã thu được.
- Trong VRF, mỗi validator sẽ roll 1 số, check với threshold và produce block nếu result < threshold.

### Cách hoạt động của BABE

Trong BABE, chúng ta có chuỗi các epochs tuần tự không chồng nhau $(e1, e2,...)$, mỗi epoch chứa $t$ block production slots tuần tự $(e_i=\{sl_1^i, sl_2^i,..., sl_t^i\})$. Vào đầu mỗi epoch, chúng ta chọn ngẫu nhiên 1 "slot leader" cho mỗi slot. Slot leader có thể là 1 hoặc nhiều party, cũng có thể không có. Việc lựa chọn này hoàn toàn bí mật, chỉ chính slot leader được chọn mới được biết, nhưng họ sẽ công khai khi claim slot của mình lúc họ produce ra block mới.

Mỗi party $P_j$ có một session key chứa ít nhất hai loại public/private key pair:

- VRF key $(sk_j^v, pk_j^v)$
- Blocks signing key $(sk_j^s, pk_j^s)$

Mỗi party $P_j$ giữ 1 bản sao local của set các blockchains $C_j=\{C_1, C_2,...C_l\}$.

Trong BABE, tất cả validators có cơ hội trở thành block producer như nhau. Xác suất để 1 validator được chọn trong 1 slot là:
$$p=\phi c(\theta)=1-(1-c)^{1/n}$$

Trong đó $0 \leq c \leq 1$ là hằng số, n là số lượng validators.

Threshold để so sánh được tính bằng công thức:
$$r=2^{l_{vrf}}\phi c(\theta)$$

Trong đó $l_{vrf}$ là độ dài của randomness value.

BABE hoạt động với 3 phases:

1. Genesis Phase

   Trong phase này, chúng ta khởi tạo genesis block (unique). Genesis block chứa 1 số ngẫu nhiên $r_1$ sử dụng để chọn slot leader trong 2 epochs đầu.

   Session public keys của các validators là $(pk_1^v,pk_2^v,...pk_n^v), (pk_1^s, pk_2^s,..., pk_n^s)$

2. Normal Phase

   Giả sử validator $V_j$ có set chains $C_j$ tại slot $sl_k$ trong epoch $e_m$, best chain $C$ được chọn trong slot $sl_{k-1}$, độ dài của $C$ là $l-1$.

   $V_j$ produce 1 block nếu người đó là slot leader của $sl_k$, hay nếu $(d) < threshold$, với $(d)$ là first output của VRF:
   $$VRF_{sk_j^v}(r_m||sl_k) \rightarrow (d, \pi)$$

   Block $B_l$ chứa slot number $sl_k$, hash của block trước đó $H_{l-1}$, VRF output $(d, \pi)$, transactions $tx$, signature $\sigma=Sign_{sk_j^s}(sl_k||H_{l-1}||d||\pi||tx)$

   Khi nhận được block mới $B=(sl, H, d', \pi', tx', \sigma')$, các validator tiến hành validate nó:

   - $Verify_{pk_j^s}(\sigma') \rightarrow valid$ (signature verification)
   - $Verify_{pk_j^v}(\pi', r_m||sl) \rightarrow valid$ và $d' < r$ (VRF's verification algorithm)
   - Tồn tại chain C' với header H
   - Tất cả các transactions trong B đều valid

   Vào cuối slot, $P_j$ chọn ra best chain của slot này thông qua chain selection rule.

3. Epoch Update Phase

   Trước khi bắt đầu epoch mới $e_m$, validators sẽ nhận được epoch randomness và active validators set mới.

   Validator set cho epoch $e_m$ phải được thêm vào relay chain trễ nhất vào cuối epoch $e_{m-3}$. Vì vậy, 1 validator có thể tham gia produce block sớm nhất sau 2 epochs sau khi họ được join vào relay chain.

   Randomness cho epoch $e_m$ được tính bằng:
   $$r_m=H(r_{m-2}||m||p)$$

   Trong đó $p$ là concat của tất cả VRF output của các blocks được produce trong epoch $e_{m-2}$.

   Đây là lý do validator chỉ có thể tham gia produce block sớm nhất sau 2 epochs, đó là để đảm bảo VRF keys của validators phải được thêm vào chain hết trước khi randomness được generate.

## GRANDPA

GRANDPA (GHOST-based Recursive Ancestor Deriving Prefix Agreement Protocol) là cơ chế finality trong Polkadot, sử dụng để quyết định final block được thêm vào blockchain là block nào, final changes là ở đâu.

- Khác với BFT (Byzantine fault-tolerant algorithms), trong GRANDPA, các validator sẽ vote ở chain, không phải ở block (với PoW, PoS các validator vote cho từng block, sau đó broadcast kết quả cho các node toàn mạng). Khi vote cho chain thì các blocks trong chain đó mặc định được vote luôn. GRANDPA sẽ tìm ra highest block number với maximum votes và chọn đó là final block.

- Do sự tách biệt giữa 2 quá trình, GRANDPA có thể finalize nhiều blocks cùng 1 lúc.

Cách hoạt động của GRANDPA:

- Mỗi node / party vote cho highest block (head of best chain) mà họ cho là valid từ round trước
- Mỗi validator sau đó submit 1 "pre-vote" cho block đó. Nếu nó có hơn 2/3 votes trong network, proof of finality được tạo ra.
- Dựa trên các "pre-votes" này, mỗi validator tính toán highest block có thể finalized. Nếu chain mới dài hơn chain trước đó, validator broadcasts "pre-commit" tới chain.
- Khi tất cả validator nhận được "pre-commits" cần thiết, họ submit "commit message" cho block được chọn tới chain.

# Accounts

## Address format

Polkadot sử dụng định dạng địa chỉ mặc định của Substrate-based chains là SS58. Đây là một định dạng được chỉnh sửa từ Bitcoin Base-58-check. Tiền tố của định dạng này thay đổi tuỳ thuộc theo loại chain.

Về cơ bản, một địa chỉ SS58 được mã hoá theo dạng sau:
`base58encode ( concat ( <address-type>, <address>, <checksum> ) )`

Trong đó, base58encode là một hàm mã hoá sử dụng base58 scheme.

![Base58 Scheme](../imgs/base58.png)

## Derivation paths

Deviration paths cho phép chúng ta có thể tạo và quản lý nhiều account cùng một gốc (seed). Chúng ta có thể coi các accounts phái sinh (derived accounts) là những accounts con của một account gốc, được tạo ra bằng cách sử dụng mnemonic seed phrase ban đầu.

Có 3 loại:

- Hard derivation
  `'caution juice atom organ advance problem want pledge someone senior holiday very//0'`
- Soft derivation
  `'caution juice atom organ advance problem want pledge someone senior holiday very/0'`

Để tạo ra một account phái sinh, chúng ta chỉ cần thay đổi số ở cuối mnemonic seed phrase trên. Chúng ta cũng có thể tự đặt custom derivation path cho mình, ví dụ:
`//john/polkadot/initial`

- Password derivation:
  `'caution juice atom organ advance problem want pledge someone senior holiday very///0'`

Đối với 2 loại trên, nếu ai đó biết mnemonic seed phrase và derivation path, họ có thể truy cập vào trong tài khoản đó. Còn trong loại này, chỉ có thể tạo và truy cập tài khoản phái sinh nếu chúng ta có mật khẩu. Nói cách khác, về mặt toán học, khi chúng ta biết được derivation path (về mặt văn bản) và mật khẩu, chúng ta có thể tính toán ra path thực tế thông qua hàm f(written path, password). Sau đó, chúng ta sẽ tìm được key pair thông qua hàm f(seed, real path) để truy cập vào tài khoản.

- So sánh soft & hard derivation:
  - Soft derivation cho phép người dùng "truy ngược" để tìm ra private key của account gốc nếu họ biết private key của account phái sinh. Ngoài ra, soft derivation thể hiện được sự liên kết giữa các accounts cùng seed. Nói cách khác, soft derivation cho phép proof-of-parent.
  - Hard derivation không cho phép điều đó

# Cryptography

## Hashing algorithm

Polkadot sử dụng thuật toán Blake2b.

![Blake2b](../imgs/internal_structure_of_blake2b.png)

Blake2b có thể được chia thành 2 phần:

- Module generateBlock: pad đầu vào thành các khối fixed size sau đó thông báo cho module digest. Mỗi khối (chunk) trong blake2b có 16 message words (128-byte chunk), mỗi message word là 64 bits (8-byte word).
- Module blake2bDigest: Tính toán hash values

Ví dụ:

```
BLAKE2b-512("The quick brown fox jumps over the lazy dog") =
a8add4bdddfd93e4877d2746e62817b116364a1fa7bc148d95090bc7333b3673f82401cf7aa2e4cb1ecd90296e3f14cb5413f8ed77be73045b13914cdcd6a918
BLAKE2b-512("The quick brown fox jumps over the lazy dof") =
ab6b007747d8068c02e25a6008db8a77c218d94f3b40d2291a7dc8a62090a744c082ea27af01521a102e42f480a31e9844053f456b4b41e8aa78bbe5c12957bb
```

Chúng ta có thể thấy, chỉ đổi 1 ký tự của message cũng làm thay đổi hash value khá nhiều, thể hiện avalanche effect: "Khi một bit đầu vào bị thay đổi, xác suất 1 bit đầu ra bị thay đổi là 50%".

Chi tiết thuật toán Blake2b được trình bày trong phần dưới đây.

### Initialize vectors

Vector khởi tạo (Initialize vector - IV) là một số tuỳ ý có thể được sử dụng với private key để mã hoá dữ liệu. IV còn được gọi là nonce (number used once), chỉ được sử dụng một lần trong bất kỳ phiên nào để ngăn chặn việc giải mã trái phép dữ liệu.

Blake2b tính toán IV bằng cách lấy 64 bit đầu tiên trong phần thập phân của căn bậc hai tám số nguyên tố đầu tiên.

```
IV0 = 0x6a09e667f3bcc908   // Frac(sqrt(2))
IV1 = 0xbb67ae8584caa73b   // Frac(sqrt(3))
IV2 = 0x3c6ef372fe94f82b   // Frac(sqrt(5))
IV3 = 0xa54ff53a5f1d36f1   // Frac(sqrt(7))
IV4 = 0x510e527fade682d1   // Frac(sqrt(11))
IV5 = 0x9b05688c2b3e6c1f   // Frac(sqrt(13))
IV6 = 0x1f83d9abfb41bd6b   // Frac(sqrt(17))
IV7 = 0x5be0cd19137e2179   // Frac(sqrt(19))
```

### Algorithm

Pseudocode của thuật toán blake2b. Tham khảo thêm tại https://en.wikipedia.org/wiki/BLAKE_(hash_function)#BLAKE2b_algorithm

```
Algorithm BLAKE2b
   Input:
      M                               Message to be hashed
      cbMessageLen: Number, (0..2128)  Length of the message in bytes
      Key                             Optional 0..64 byte key
      cbKeyLen: Number, (0..64)       Length of optional key in bytes
      cbHashLen: Number, (1..64)      Desired hash length in bytes
   Output:
      Hash                            Hash of cbHashLen bytes

   Initialize State vector h with IV
   h0..7 ← IV0..7

   Mix key size (cbKeyLen) and desired hash length (cbHashLen) into h0
   h0 ← h0 xor 0x0101kknn
         where kk is Key Length (in bytes)
               nn is Desired Hash Length (in bytes)

   Each time we Compress we record how many bytes have been compressed
   cBytesCompressed ← 0
   cBytesRemaining  ← cbMessageLen

   If there was a key supplied (i.e. cbKeyLen > 0)
   then pad with trailing zeros to make it 128-bytes (i.e. 16 words)
   and prepend it to the message M
   if (cbKeyLen > 0) then
      M ← Pad(Key, 128) || M
      cBytesRemaining ← cBytesRemaining + 128
   end if

   Compress whole 128-byte chunks of the message, except the last chunk
   while (cBytesRemaining > 128) do
      chunk ← get next 128 bytes of message M
      cBytesCompressed ← cBytesCompressed + 128  increase count of bytes that have been compressed
      cBytesRemaining  ← cBytesRemaining  - 128  decrease count of bytes in M remaining to be processed

      h ← Compress(h, chunk, cBytesCompressed, false)  false ⇒ this is not the last chunk
   end while

   Compress the final bytes from M
   chunk ← get next 128 bytes of message M  We will get cBytesRemaining bytes (i.e. 0..128 bytes)
   cBytesCompressed ← cBytesCompressed+cBytesRemaining  The actual number of bytes leftover in M
   chunk ← Pad(chunk, 128)  If M was empty, then we will still compress a final chunk of zeros

   h ← Compress(h, chunk, cBytesCompressed, true)  true ⇒ this is the last chunk

   Result ← first cbHashLen bytes of little endian state vector h
End Algorithm BLAKE2b
```

## Keypairs and signing

Như đã biết, Bitcoin thực thi quyền sở hữu bằng một thuật toán gọi là Chữ ký kỹ thuật số đường cong Elliptic (Elliptic Curve Digital Signature Algorithm, gọi tắt là ECDSA). Thuật toán này cho phép chúng ta lấy một số (tức khóa riêng tư) và tạo ra một khóa công khai từ đó.

Polkadot sử dụng thuật toán tương tự thay thế cho ECDSA là Schnorrkel/Ristretto x25519 (SR25519) để sinh khoá.

SR25519 là thuật toán dựa trên Curve25519, một dạng đường cong Elliptic.

Đường cong Elliptic được ứng dụng nhiều trong mật mã học. Về cơ bản, đường cong elliptic có dạng tổng quát phương trình Weierstrass như sau:

$$
y^2 + a_1xy + a_3xy = x^3 + a_2x^2 + a_4x + a_6
$$

Sau 1 số phép thế và phép biến đổi thì phương trình rút gọn chỉ còn:

$$
y^2 = x^3 + Ax + B
$$

Với điều kiện:

$$
4A^3 + 27B^2 \neq 0
$$

Đây cũng là dạng chủ yếu xuất hiện trong các tài liệu.

Mật mã đường cong Elliptic (ECC) sử dụng các tính chất toán học của đường cong Elliptic để tạo ra các hệ thống mật mã khóa công khai (khóa mà bạn sử dụng để mã hóa dữ liệu của mình có thể được công khai trong khi khóa được sử dụng để giải mã dữ liệu của bạn có thể được giữ kín). Giống như tất cả các mật mã khóa công khai, ECC dựa trên các hàm toán học đơn giản để tính toán theo một hướng, nhưng rất khó để đảo ngược. Độ an toàn của ECC dựa vào bài toán logarit rời rạc trên nhóm các điểm của đường cong Elliptic.

Đường cong Elliptic Curve25519 được thiết kế để sử dụng với giao thức Elliptic-curve Diffie-Hellman (ECDH). Cụ thể, phương trình đường cong được viết dưới dạng:

$$
y^2 = x^3 + 486662x^2 + x
$$

Đây là một Montgomery curve, đồ thị có dạng sau:

![Montgomery curve](../imgs/Montgomery%20curve.png)

Như đã nói ở trên, Polkadot không dùng thuật toán ECDSA mà sử dụng thuật toán chữ ký Schnorr. Loại chữ ký này sở hữu một đặc tính mạnh mẽ là <b>độ tuyến tính</b>. Dễ hiểu hơn, điều này làm cho loại chữ ký này này đặc biệt phù hợp với các giao dịch đa chữ ký. (Tham khảo thêm ở <a href="https://en.wikipedia.org/wiki/Schnorr_signature">đây</a> và ở <a href = "https://research.web3.foundation/en/latest/crypto/multisig.html">đây</a>)

## Keys

Key trong Polkadot được chia làm 3 loại

- Account Keys
- "Controller" & "Stash" Keys
- Session Keys

# Architecture

## Bridges

Brigdes được tạo ra để giúp Polkadot tương thích với các blockchain khác (e.g., Bitcoin, Ethereum, etc.)

Có 3 cách để xây dựng bridge:

- Bridge pallets: Xây dựng bridge giữa Polkadot và 1 Substrate-based chain khác (e.g., Kusama <-> Polkadot)
- Smart contracts: Xây dựng bridge giữa Polkadot và 1 non-Substrate chain (smart contracts cần được cài đặt bên phía non-Substrate chain, e.g. Ethereum mainnet có bridge smart contract cho phép thực thi Eth transactions dựa trên incoming XCMP messages)
- Higher-order protocols: Nếu non-Substrate chain không hỗ trợ smart contract (e.g., Bitcoin), cần sử dụng các protocols khác (e.g., XClaim)

## Cross-Consensus Message Format (XCM)

XCM là một là định dạng message “đồng thuận chéo” cho phép giao tiếp và chuyển giao tài sản kỹ thuật số giữa các parachains. XCM không dành riêng cho Polkadot, vì nó hướng đến mục tiêu trở thành một ngôn ngữ chung và có thể mở rộng giữa các hệ thống đồng thuận khác nhau. Tham khảo thêm tại <a href = "https://research.web3.foundation/en/latest/polkadot/XCMP/index.html"> đây</a>.

\*Lưu ý: XCM là định dạng message, không phải giao thức truyền tin.

![XCM Tech Stack](../imgs/cross-consensus-tech-stack-e9c1b2ab8b6f6f3f9a78b3a412af0698.png)

Core của XCM là XCVM (Cross-Consensus Virtual Machine). Một message trong XCM thực chất là một chương trình chạy trên XCVM. Tham khảo thêm tại <a href = "https://medium.com/polkadot-network/xcm-the-cross-consensus-message-format-3b77b1373392"> đây</a>.

Polkadot triển khai hai Cross-Consensus Protocol:

- XCMP (Cross-chain Message Passing): cho phép các parachain trao đổi thông tin với nhau

  - Direct: message truyền trực tiếp giữa các parachain (O(1))
  - Relayed: message truyền thông qua relay-chain

  Trong XCMP, các cross-chain transactions được sắp xếp giải quyết bằng cơ chế hàng đợi dựa trên Merkle tree. Relay chain validators có nhiệm vụ di chuyển transactions từ output queue của một chain vào input queue của chain đích. Tuy nhiên, chỉ có associated metadata được lưu trữ dưới dạng hash trong relay chain storage.

- VMP (Vertical Message Passing): cho phép các parachain trao đổi message với relay chain.

  - UMP (upward message passing) cho phép các parachain gửi thông tin đến relay chain
  - DMP (downward message passing) cho phép relay chain truyền thông tin xuống một trong các parachains

- HRMP (Horizontal Relay-routed Message Passing - XCMP Lite): stop-gap protocol, giao diện và chức năng tương tự như XCMP nhưng đòi hỏi nhiều tài nguyên hơn vì thông tin được lưu trữ toàn bộ trên relay chain storage.

![Cross-Consensus](../imgs/overview-1-2048x1126.png)

### Đăng ký kênh

Trước khi hai chain có thể bắt đầu tương tác với nhau, hay nói cách khác, trước khi tạo XCMP queue, một channel giữa 2 parachains đó phải được mở. Các kênh là một chiều, có nghĩa là một kênh từ chain A đến chain B sẽ chỉ chuyển thông tin từ A đến B. Do đó, chỉ có thể chuyển tài sản từ tin A đến B. Do đó, phải mở cả hai kênh để gửi thông tin (hoặc chuyển assets) qua lại.
Cần một lượng deposit để mở kênh, lượng này sẽ được hoàn lại khi kênh đóng.

Channel XCM giữa relay chain và parachain được tự động mở khi kết nối được thiết lập. Tuy nhiên, khi parachain A muốn mở một channel với parachain B, parachain A phải gửi một channel extrinsic trong mạng của nó. Extrinsic này cũng là một XCM. Bên nhận XCM này là relay chain và extrinsic sẽ bao gồm thông tin như:

- Địa điểm đích – nơi thông tin sẽ được triển khai (trong trường hợp này là relay chain)
- Tài khoản sẽ trả phí (thanh toán bằng token relay chain)
- Phí mà giao dịch có thể tiêu tốn khi thực hiện
- Dữ liệu yêu cầu được mã hóa, thu được bằng cách thực hiện tương tự như trên relay chain. Điều này bao gồm thông tin được mã hóa sau:
  - Phương thức được yêu cầu trong relay chain (open channel)
  - Parachain ID của chain đích (parachain B trong ví dụ này)
  - Số lượng thông tin tối đa trong hàng đợi đích
  - Kích thước tối đa của thông tin sẽ được gửi
  - Phí giao dịch được thanh toán bằng phiên bản đại diện cross-chain (xc) của tài sản relay chain (xcRelayChainAsset). Ví dụ: đối với Kusama / Moonriver, phí giao dịch sẽ được thanh toán bằng xcKSM. Do đó, tài khoản thanh toán phí phải có đủ xcRelayChainAsset.

Sau đó, parachain B cũng phải gửi một extrinsic (cũng là một XCM) vào relay chain.
