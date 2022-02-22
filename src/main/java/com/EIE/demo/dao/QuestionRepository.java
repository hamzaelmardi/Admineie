package com.EIE.demo.dao;

import com.EIE.demo.model.Questions;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface QuestionRepository extends JpaRepository<Questions, Integer> {


    @Query("select q from Questions q left join q.autorisation a where q.deleteDateTime is null and a.deleteDateTime is null and q.type like '1' and a.id_autorisation=:auto")
    public Page<Questions> getquestionByAutorisation(Pageable pageRequest, int auto);

    @Query("select q from Questions q left join q.eveluation a where q.deleteDateTime is null and a.deleteDateTime is null and q.type like '2' and a.id_evaluation=:auto")
    public Page<Questions> getquestionByEvaluation(Pageable pageRequest, int auto);

    @Query("select q from  Questions q where q.deleteDateTime is null order by q.id_question ASC  ")
    public Page<Questions> getAllQuestion(Pageable page);

    @Query("select q from  Questions q where q.deleteDateTime is null order by q.nbr DESC  ")
    public Page<Questions> getAllQuestion1(Pageable page);

    @Query("select q from  Questions q where q.deleteDateTime is null order by q.nbr ASC  ")
    public Page<Questions> getAllQuestionByNumero(Pageable page);

    @Query("from Questions where id_question=:id and deleteDateTime is null order by id_question desc ")
    public Questions getQuestionById(int id);

    @Query("from Questions q where q.type LIKE(:rech) or q.type LIKE('%:rech%')  and q.deleteDateTime is null  order by q.id_question desc ")
    public Page<Questions> getQuestionLiketitle(Pageable pageRequest, @Param("rech") String rech);

    @Query("select q from Questions q  where q.deleteDateTime is null and q.type like '2' order by q.id_question desc")
    public Page<Questions> getAllQuestionEvaluation(Pageable pageRequest);

    @Query("select q from Questions q  where q.deleteDateTime is null and q.type like '1' order by q.id_question desc")
    public Page<Questions> getAllQuestionAutorisation(Pageable pageRequest);


    @Query("select q from Questions q  where q.deleteDateTime is null and q.type =:type order by q.id_question ASC")
    public Questions[] getAllQuestionAutorisationA(String type);

}


