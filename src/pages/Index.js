import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import CounterAnimation from "../tech/CounterAnimation";
import StatisticsComponent from "../tech/StatisticsComponent";


const Index = () => {
  const userInfo = JSON.parse(localStorage.getItem("userInfo")).userInfo;
  const [greeting, setGreeting] = useState("");
  const [statistics, setStatistics] = useState(null);

  useEffect(() => {
    // Fetch data from the API
    fetch("http://localhost:3110/api/get/statistics")
      .then((response) => response.json())
      .then((data) => setStatistics(data))
      .catch((error) => console.error("Error fetching data:", error));
  }, []);
  useEffect(() => {
    const getCurrentTime = () => {
      const currentTime = new Date().getHours();

      if (currentTime >= 5 && currentTime < 12) {
        setGreeting("Доброе утро");
      } else if (currentTime >= 12 && currentTime < 18) {
        setGreeting("Добрый день");
      } else if (currentTime >= 18 && currentTime < 24) {
        setGreeting("Добрый вечер");
      } else {
        setGreeting("Доброй ночи");
      }
    };

    getCurrentTime();

    const intervalId = setInterval(getCurrentTime, 60000);

    return () => clearInterval(intervalId);
  }, []);

  return (
    <div>
      <main>
        <div className="container px-4 pt-3" id="featured-3">
          <h3 className="pb-2 border-bottom text-secondary">
            <b>{greeting},</b>{" "}
            <span
              className={
                [
                  "System Administrator",
                  "Administrator",
                  "Администратор",
                  "Dmitriy",
                ].includes(userInfo.complectName)
                  ? "text-danger"
                  : ""
              }
            >
              {userInfo.complectName}
            </span>
          </h3>
          <div className="row">
            <div className="row tilesWrap">
              <div className="col-sm-3 mx-auto pb-3 ">
                <li className="first ">
                  <h2>01</h2>
                  <h3 className="text-dark">Стаж</h3>
                  <p>
                    Распределение персонала по стажу работы (без внешних
                    совместителей и работающих по договорам гражданско-правового
                    характера)
                  </p>
                  <Link to="/experience" className="btn btn-primary zoom-5">
                    Перейти
                  </Link>
                </li>
              </div>
              <div className="col-sm-3 mx-auto pb-3">
                <li className="second">
                  <h2>02</h2>
                  <h3 className="text-dark">Образование</h3>
                  <p>
                    Распределение численности основного персонала по уровню
                    образования и полу (без внешних совместителей и работающих
                    по договорам ГПХ)
                  </p>
                  <Link to="/eductions" className="btn btn-primary zoom-5">
                    Перейти
                  </Link>
                </li>
              </div>

              <div className="col-sm-3 mx-auto pb-3">
                <li className="third">
                  <h2>03</h2>
                  <h3 className="text-dark">Инвалиды и лица с ОВЗ</h3>
                  <p>
                    Сведения по численности студентов, относящихся к категории
                    инвалиды и лица с ОВЗ, по специальностям, профессиям
                  </p>
                  <Link to="/invalids" className="btn btn-primary zoom-5">
                    Перейти
                  </Link>
                </li>
              </div>
             {/* <div className="col-sm-3 pb-3">
                <li className="fourth">
                  <h2>04</h2>
                  <h3 className="text-dark">Программы </h3>
                  <p>
                    Перечень реализуемых образовательных программ среднего
                    профессионального образования и информация по контингенту
                  </p>
                  <Link to="/contingent" className="btn btn-primary zoom-5">
                    Перейти
                  </Link>
                </li>
                    </div>
                    */}
            </div>
            
            
            {statistics && (
              <div className="col-sm-12">
                <div className="card ">
                  <div className="card-body">
                    <h5 className="card-title">Статистика</h5>
                    <hr />

                    <div className="d-inline">
                      <div className="d-inline-flex mx-auto">
                      <div className="me-4">
                        <h6 className="card-title">Статистика за все время</h6>
                        <div className="d-flex">
                          <div>
                            <p className="card-text me-3">Отчетов принято</p>
                            <span
                              to="/contingent"
                              className="btn btn-primary zoom-5"
                            >
                              <CounterAnimation
                                value={
                                  statistics.totalStatistics.totalAllTimeCount
                                }
                              />
                            </span>{" "}
                          </div>

                          <div>
                            <p className="card-text">Респондентов отчиталось</p>
                            <span
                              to="/contingent"
                              className="btn btn-primary zoom-5"
                            >
                              <CounterAnimation
                                value={
                                  statistics.totalStatistics.allTimeUniqueUsers-3
                                }
                              />
                            </span>
                          </div>
                        </div>
                      </div>

                      <div>
                        <h6 className="card-title">
                          Статистика за текущий год
                        </h6>
                        <div className="d-flex">
                          <div>
                            <p className="card-text me-3">Отчетов принято</p>
                            <span
                              to="/contingent"
                              className="btn btn-primary zoom-5"
                            >
                              <CounterAnimation
                                value={statistics.totalStatistics.totalYear2023Count-1
                                }
                              />
                            </span>
                          </div>

                          <div>
                            <p className="card-text">Респондентов отчиталось</p>
                            <span
                              to="/contingent"
                              className="btn btn-primary zoom-5"
                            >
                              <CounterAnimation
                                value={
                                  statistics.totalStatistics.allTimeUniqueUsers-statistics.totalStatistics.users2023
                                }
                              />
                            </span>
                          </div>
                        </div>
                      </div>

                      <div className="ms-4">
                        <h6 className="card-title">Статистика за 2023 год</h6>
                        <div className="d-flex">
                          <div>
                            <p className="card-text me-3">Отчетов принято</p>
                            <span
                              to="/contingent"
                              className="btn btn-primary zoom-5"
                            >
                              <CounterAnimation
                                value={
                                  statistics.totalStatistics.totalYear2024Count
                                  
                                }
                              />
                            </span>
                          </div>

                          <div>
                            <p className="card-text">Респондентов отчиталось</p>
                            <span className="btn btn-primary zoom-5">
                              <CounterAnimation
                                value={
                                  statistics.totalStatistics.users2023-1
                                  
                                }
                              />
                            </span>
                          </div>
                        </div>
                      </div>
                      </div>
                    <hr />
                        <StatisticsComponent statistics={statistics} />
                    </div>
                  </div>
                </div>
              </div>
            )}
          </div>
        </div>
      </main>
    </div>
  );
};

export default Index;
