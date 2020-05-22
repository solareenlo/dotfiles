#include <iostream>
#include <map>
#include <set>
#include <vector>
#define REP(i, n) for (int i = 0; i < (n); i++)
using namespace std;

// 出力
void print() { std::cout << '\n'; }
template <class T>void print(const T &x) {std::cout << x <<'\n';}
template <class T, class... Args>void print(const T &x, const Args &... args) {std::cout << x << " ";print(args...);}

{% if mod %}
const long long MOD = {{ mod }};
{% endif %}
{% if yes_str %}
const string YES = "{{ yes_str }}";
{% endif %}
{% if no_str %}
const string NO = "{{ no_str }}";
{% endif %}

{% if prediction_success %}
void solve({{ formal_arguments }}){

}
{% endif %}

int main(){
    cin.tie(0);
    ios::sync_with_stdio(false);
    {% if prediction_success %}
    {{input_part}}
    solve({{ actual_arguments }});
    {% else %}
    // Failed to predict input format
    {% endif %}
    return 0;
}
