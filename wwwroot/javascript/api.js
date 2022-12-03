/**
 * 驗證時效
 * @param {*} data
 * @returns
 */
export function verifyExpiration(data) {
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
      resolve(false);
    });
  });
}
/**
 * 驗證資料
 * @param {*} data 
 * @returns 
 */
export async function verifyToken(data) {
  const url = `/v1/Verify/Token`;
  return await fetchPost(url, data);
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

/**
 *
 * @param {*} seq
 * @returns
 */
export async function getCourse(seq) {
  const url = `/v1/Course/${seq}`;
  return await fetchGet(url);
}

/**
 *
 * @param {*} courseSeq
 * @param {*} appendixSeq
 * @returns
 */
export async function getViewHistory(courseSeq, appendixSeq) {
  const url = `/v1/Course/ViewHistory/${courseSeq}/${appendixSeq}`;
  return await fetchGet(url);
}
/**
 * 觀看紀錄
 * @param {*} data
 * @returns
 */
export async function setViewHistory(data) {
  const url = `/v1/Course/ViewHistory`;
  return await fetchPost(url, data);
}
/**
 * 觀看紀錄-結束
 * @param {*} seq
 * @returns
 */
export async function setViewHistoryEnd(seq) {
  const url = `/v1/Course/ViewHistory/End/${seq}`;
  return await fetchPost(url, data);
}

/**
 *
 * @param {*} data
 * @returns
 */
export async function addViewLog(data) {
  const url = `/v1/ViewLog`;
  return await fetchPost(url, data);
}
