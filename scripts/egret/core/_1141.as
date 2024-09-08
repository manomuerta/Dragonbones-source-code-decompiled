package egret.core
{
   import _1045._1084;
   import _1088._1098;
   import _1193._1192;
   import egret.managers._1201;
   import egret.managers._1204;
   import egret.managers._1211;
   import egret.managers._1216;
   import egret.managers._1218;
   import flash.display.Stage;
   import flash.utils.Dictionary;
   
   use namespace ns_egret;
   
   public class _1141
   {
      ns_egret static var stage:Stage;
      
      ns_egret static var _1609:_1216;
      
      ns_egret static var _8711:Function;
      
      ns_egret static var _8708:Function;
      
      public static var _8368:Boolean = true;
      
      public static var _8707:Boolean = false;
      
      private static var _8714:Dictionary = new Dictionary();
      
      private static var _8710:Dictionary = new Dictionary();
      
      private static var _8715:Boolean = false;
      
      ns_egret static var _8713:Array = [];
      
      ns_egret static var _1615:Array = [];
      
      public function _1141()
      {
         super();
      }
      
      public static function _8325(param1:*) : Boolean
      {
         var _loc3_:_1084 = null;
         var _loc4_:_1133 = null;
         var _loc2_:Boolean = false;
         if(param1 is _1140)
         {
            _loc2_ = _1140(param1).getStyle("forEgret");
         }
         if(param1 is _1192)
         {
            if(_1192(param1).target)
            {
               _loc2_ = _1192(param1).target.getStyle("forEgret");
            }
         }
         if(param1 is _1098)
         {
            _loc3_ = _1098(param1).target;
            if(_loc3_._2249 > 0)
            {
               _loc4_ = _loc3_.getElementAt(0);
               if(_loc4_ is _1140)
               {
                  _loc2_ = _1140(_loc4_).getStyle("forEgret");
               }
            }
         }
         return _loc2_;
      }
      
      ns_egret static function _8702(param1:Stage) : void
      {
         var firstStage:Stage = param1;
         if(_8715 || !firstStage)
         {
            return;
         }
         ns_egret::stage = firstStage;
         ns_egret::stage.addEventListener("callLaterError",function():void
         {
         });
         ns_egret::_1609 = new _1216();
         _8715 = true;
      }
      
      ns_egret static function _8712(param1:_1211) : void
      {
         var _loc2_:int = int(ns_egret::_8713.indexOf(param1));
         if(_loc2_ == -1)
         {
            ns_egret::_8713.push(param1);
            addStage(param1.stage);
         }
      }
      
      ns_egret static function _8709(param1:_1211) : void
      {
         var _loc2_:int = int(ns_egret::_8713.indexOf(param1));
         if(_loc2_ != -1)
         {
            ns_egret::_8713.splice(_loc2_,1);
         }
      }
      
      private static function addStage(param1:Stage) : void
      {
         var focusManager:_1204 = null;
         var screenDPIManager:_1218 = null;
         var focusClass:Class = null;
         var stage:Stage = param1;
         var index:int = int(ns_egret::_1615.indexOf(stage));
         if(index == -1)
         {
            ns_egret::_1615.push(stage);
            if(ns_egret::_8711 != null)
            {
               ns_egret::_8711(stage);
            }
            try
            {
               focusClass = Injector.getClass(_1204);
               focusManager = new focusClass();
            }
            catch(e:Error)
            {
               focusManager = new _1201();
            }
            focusManager.stage = stage;
            _8714[stage] = focusManager;
            screenDPIManager = new _1218();
            screenDPIManager.stage = stage;
            _8710[stage] = screenDPIManager;
         }
      }
      
      ns_egret static function _8637(param1:Stage) : void
      {
         var _loc3_:_1204 = null;
         var _loc4_:_1218 = null;
         var _loc2_:int = int(ns_egret::_1615.indexOf(param1));
         if(_loc2_ != -1)
         {
            if(ns_egret::_8708 != null)
            {
               ns_egret::_8708(param1);
            }
            _loc3_ = _8714[param1];
            delete _8714[param1];
            _loc3_.stage = null;
            _loc4_ = _8710[param1];
            delete _8710[param1];
            _loc4_.stage = null;
            ns_egret::_1615.splice(_loc2_,1);
            if(ns_egret::_1615.length > 0)
            {
               _1141.ns_egret::stage = ns_egret::_1615[0];
            }
         }
      }
   }
}

