"use strict";

module.exports = compute;

function compute (strand1, strand2) {
    var len1 = strand1.length;
    var len2 = strand2.length;

    if (len1 != len2) {
        throw new Error('DNA strands must be of equal length.');
    }

    var idx = 0;
    var len = Math.max(len1, len2);
    var rst = 0;

    while (idx < len) {
        if (strand1[idx] !== strand2[idx]) {
            rst ++;
        }
        idx ++;
    }
    return rst;
}
