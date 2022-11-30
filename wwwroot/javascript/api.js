/**
 *
 * @param {*} data
 * @returns
 */
export function verifyToken(data) {
  return new Promise((resolve, reject) => {
    const url = `/v1/Verify/Token`;
    fetchPost(url, data).then((resp) => {
      if (resp.resultCode == 10) {
        const expAt = moment(resp.content.expiration);
        const nowAt = moment();
        const isVerify = nowAt.diff(expAt, "minutes") > 0 ? false : true;
        if (isVerify == false) {
          clearAll();
        }
        resolve(isVerify);
      }
      reject(false);
    });
  });
}
/**
 *
 * @param {*} account
 * @param {*} password
 * @returns
 */
export async function getVerifyToken(account, password) {
  const url = `/v1/Verify/Token/${account}/${password}`;
  return await fetchGet(url);
}
/**
 * 最新上架
 * @returns
 */
export async function getLast(params) {
  const url = `/v1/Course/Last${params}`;
  return await fetchGet(url);
}
/**
 * 繼續看
 * @param {*} params
 * @returns
 */
export async function getHalf(params) {
  const url = `/v1/Course/Half${params}`;
  return await fetchGet(url);
}
/**
 * 全部課程
 * @param {*} params
 * @returns
 */
export async function getMine(params) {
  const url = `/v1/Course/Mine${params}`;
  return await fetchGet(url);
}
/**
 * 我的課程
 * @param {*} params
 * @returns
 */
export async function getSelf(params) {
  const url = `/v1/Course/Self${params}`;
  return await fetchGet(url);
}

/**
 *
 * @param {*} seq
 * @returns
 */
export async function getSignup(seq) {
  const url = `/v1/CourseSignup?courseSeq=${seq}`;
  return await fetchGet(url);
}

/**
 *
 * @returns
 */
export async function getMaps() {
  const url = `/v1/Course/Maps`;
  return await fetchGet(url);
}
