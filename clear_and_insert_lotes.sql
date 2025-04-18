USE tienda;

-- 1. Limpiar todas las tablas (deshabilitar comprobación de FK para evitar errores de dependencia)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE lotes_donaciondetalle;
TRUNCATE TABLE lotes_donacion;
TRUNCATE TABLE lotes_lotedet;
TRUNCATE TABLE lotes_lote;
TRUNCATE TABLE lotes_destino;
TRUNCATE TABLE lotes_producto;
TRUNCATE TABLE lotes_proveedor;
TRUNCATE TABLE lotes_usuario;
SET FOREIGN_KEY_CHECKS = 1;

-- 2. Insertar datos de prueba

-- lotes_usuario
INSERT INTO lotes_usuario (id, nombre, login, password, rol) VALUES
  (1, 'Irma',   'Pattynk',  '12345678', 'Gerente'),
  (2, 'Luis',   'Moneda',   '456',      'Almacen'),
  (3, 'Anette', 'Airamita', '789',      'Almacen');

-- lotes_proveedor
INSERT INTO lotes_proveedor (id, nombre,                    direccion                             , contacto         , telefono      , email                             , activo) VALUES
  (1, 'Distribuidora Central',  'Calle Comercio 120, Col. Centro'      , 'Laura Pérez'    , '555-678-1234', 'lperez@central.com'             , 1),
  (2, 'Proveedora del Norte',   'Av. Industrial 45, Parque Norte'      , 'Jorge Sánchez'  , '555-789-2345', 'jsanchez@norte.com'             , 1),
  (3, 'Productos del Sur',      'Blvd. Sureste 200, Zona Sur'          , 'Ana Ramírez'    , '555-890-3456', 'aramirez@sursupplies.com'       , 1),
  (4, 'Alimentos Selectos',     'Calle Gourmet 17, Col. Delicias'      , 'Carlos Mendoza' , '555-901-4567', 'cmendoza@selectos.mx'           , 1),
  (5, 'Granos y Cereales SA',   'Av. Agropecuaria 300, Campo Verde'    , 'Marta Villanueva','555-012-5678','mvillanueva@granosycereales.com', 1),
  (6, 'Comercializadora 2000',  'Av. Comercio 50, Centro Urbano'       , 'Patricia Gómez' , '555-234-0001', 'pgomez@comercial2000.com'       , 1),
  (7, 'Empacadora del Bajío',   'Carretera Bajío km 12'                , 'Ricardo Torres' , '555-345-0002', 'rtorres@bajioempacadora.mx'     , 1),
  (8, 'Lácteos y Derivados',    'Camino al Rancho 75, Zona Rural'      , 'Elena Cruz'     , '555-456-0003', 'ecruz@lacteosderivados.mx'      , 1),
  (9, 'Grupo Alimenticio Real', 'Av. Real 10, Ciudad Real'             , 'Víctor Salazar' , '555-567-0004', 'vsalazar@alimenticioreal.com'   , 1);

-- lotes_producto
INSERT INTO lotes_producto (id, nombre,                   unidad_medida, codigo_barras      ) VALUES
  (1,  'Leche Entera 1L',        'Litro'    , '7501031312345'),
  (2,  'Azúcar Refinada 1kg',    'Kilogramo', '7501031312346'),
  (3,  'Arroz Blanco 900g',      'Gramo'    , '7501031312347'),
  (4,  'Aceite Vegetal 1L',      'Litro'    , '7501031312348'),
  (5,  'Frijol Negro 1kg',       'Kilogramo', '7501031312349'),
  (6,  'Sal de Mesa 500g',       'Gramo'    , '7501031312350'),
  (7,  'Harina de Trigo 1kg',    'Kilogramo', '7501031312351'),
  (8,  'Huevo Blanco 12 pzas',   'Pieza'    , '7501031312352'),
  (9,  'Pan de Caja 680g',       'Gramo'    , '7501031312353'),
  (10, 'Agua Purificada 1.5L',   'Litro'    , '7501031312354');

-- lotes_destino
INSERT INTO lotes_destino (id, nombre                     , direccion                                  , contacto        , telefono      , activo) VALUES
  (1, 'Casa Hogar Luz de Vida',        'Av. Esperanza #123, Ciudad Esperanza' , 'María González', '555-123-4567', 1),
  (2, 'Comedor Comunitario San José',  'Calle Principal #45, Col. Centro'     , 'Jorge Ramírez' , '555-234-5678', 1),
  (3, 'Fundación Sonrisas',            'Blvd. Alegría #89, Zona Norte'        , 'Laura Martínez', '555-345-6789', 1),
  (4, 'Institución Manos Amigas',      'Calle Progreso #10, Ciudad Futuro'    , 'Pedro Hernández','555-456-7890', 1),
  (5, 'Albergue Nueva Esperanza',      'Av. Reforma #80, Col. Reforma'        , 'Ana López'     , '555-567-8901', 1);

-- lotes_lote
INSERT INTO lotes_lote (id, codigo,     fecha_caducidad, fecha_recepcion, ubicacion      , proveedor_id, usuario_captura_id, fecha_captura          ) VALUES
  (1, 'LT20240401', '2025-05-15'   , '2025-04-01'  , 'Almacén A1'   , 1          , 1                 , '2025-04-01 10:23:00'),
  (2, 'LT20240402', '2025-06-10'   , '2025-04-02'  , 'Almacén A2'   , 2          , 2                 , '2025-04-02 09:50:00'),
  (3, 'LT20240403', '2025-04-30'   , '2025-04-03'  , 'Cámara Fría 1', 3          , 3                 , '2025-04-03 14:12:00'),
  (4, 'LT20240404', '2025-05-20'   , '2025-04-04'  , 'Almacén A3'   , 4          , 2                 , '2025-04-04 11:45:00'),
  (5, 'LT20240405', '2025-07-01'   , '2025-04-05'  , 'Almacén A1'   , 6          , 3                 , '2025-04-05 10:10:00'),
  (6, 'LT20240406', '2025-05-25'   , '2025-04-06'  , 'Cámara Fría 2', 5          , 1                 , '2025-04-06 13:30:00'),
  (7, 'LT20240407', '2025-06-15'   , '2025-04-07'  , 'Almacén A4'   , 7          , 2                 , '2025-04-07 08:55:00'),
  (8, 'LT20240408', '2025-05-05'   , '2025-04-08'  , 'Almacén A2'   , 2          , 1                 , '2025-04-08 09:20:00'),
  (9, 'LT20240409', '2025-06-30'   , '2025-04-09'  , 'Cámara Fría 3', 8          , 3                 , '2025-04-09 15:00:00'),
  (10,'LT20240410', '2025-05-10'   , '2025-04-10'  , 'Almacén A5'   , 9          , 1                 , '2025-04-10 10:05:00');

-- lotes_lotedet
INSERT INTO lotes_lotedet (id, lote_id, producto_id, cantidad, usuario_captura_id, fecha_captura         ) VALUES
  (1, 1, 1, 120, 2, '2025-04-01 10:30:00'),
  (2, 1, 2,  80, 2, '2025-04-01 10:35:00'),
  (3, 2, 3, 200, 3, '2025-04-02 10:15:00'),
  (4, 3, 4, 150, 3, '2025-04-03 14:20:00'),
  (5, 4, 5, 100, 2, '2025-04-04 12:00:00'),
  (6, 5, 6, 300, 1, '2025-04-05 10:20:00'),
  (7, 6, 7, 250, 1, '2025-04-06 13:40:00'),
  (8, 7, 8, 180, 2, '2025-04-07 09:00:00'),
  (9, 8, 9,  90, 3, '2025-04-08 10:00:00'),
  (10,9,10, 140, 3, '2025-04-09 15:10:00');

-- lotes_donacion
INSERT INTO lotes_donacion (id, fecha_donacion      , destino_id, usuario_autoriza_id, comentario                                                          , estado      ) VALUES
  (1, '2025-04-10 11:30:00', 1, 1, 'Donación por vencimiento próximo del lote LT20240401', 'Autorizado'),
  (2, '2025-04-12 09:15:00', 3, 1, 'Excedente de inventario en cámaras frías'             , 'Pendiente'),
  (3, '2025-04-13 14:20:00', 2, 1, 'Productos cercanos a vencimiento y no rotan'          , 'Autorizado'),
  (4, '2025-04-14 08:45:00', 4, 1, 'Solicitud directa de la institución'                  , 'Enviado');

-- lotes_donaciondetalle
INSERT INTO lotes_donaciondetalle (id, donacion_id, lote_id, producto_id, cantidad) VALUES
  (1, 1, 1, 1,  50),
  (2, 1, 1, 2,  30),
  (3, 2, 3, 4, 100),
  (4, 3, 2, 3,  80),
  (5, 4, 4, 5,  60);
