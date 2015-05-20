package com.energyview.realtime.services;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.energyview.realtime.mongo.models.Equipo;

@Repository
public interface EquipoRepository extends MongoRepository<Equipo, ObjectId> {


}