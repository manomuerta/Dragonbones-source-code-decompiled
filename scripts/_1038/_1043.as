package _1038
{
   import _1177.CollectionEvent;
   import _1177._1178;
   import flash.events.EventDispatcher;
   
   public class _1043 extends EventDispatcher implements _1039, _1041
   {
      private var _5864:XML;
      
      private var _5863:Array;
      
      private var _5857:Array;
      
      private var _5858:Boolean = false;
      
      public function _1043(param1:XML = null, param2:Array = null)
      {
         this._5863 = [];
         this._5857 = [];
         super();
         if(param2)
         {
            this._5857 = param2.concat();
         }
         if(param1)
         {
            this._5864 = param1;
            if(this._5858)
            {
               this._5863.push(this._5864);
            }
            this._5855(this._5864,this._5863);
         }
      }
      
      public function get source() : XML
      {
         return this._5864;
      }
      
      public function set source(param1:XML) : void
      {
         this._5864 = param1;
         this._5857 = [];
         this._5863 = [];
         if(this._5864)
         {
            if(this._5858)
            {
               this._5863.push(this._5864);
            }
            this._5855(this._5864,this._5863);
         }
         this._5853(_1178.RESET);
      }
      
      public function get _5860() : Array
      {
         return this._5857.concat();
      }
      
      public function set _5860(param1:Array) : void
      {
         this._5857 = !!param1 ? param1.concat() : [];
         this.refresh();
      }
      
      public function get length() : int
      {
         return this._5863.length;
      }
      
      public function getItemAt(param1:int) : Object
      {
         return this._5863[param1];
      }
      
      public function getItemIndex(param1:Object) : int
      {
         var _loc2_:int = int(this._5863.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._5863[_loc3_] === param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return 0;
      }
      
      public function _4016(param1:Object) : void
      {
         var _loc2_:int = this.getItemIndex(param1);
         if(_loc2_ != -1)
         {
            this._5853(_1178.UPDATE,_loc2_,-1,[param1]);
         }
      }
      
      public function get _5804() : Boolean
      {
         return this._5858;
      }
      
      public function set _5804(param1:Boolean) : void
      {
         if(this._5858 == param1)
         {
            return;
         }
         this._5858 = param1;
         if(this._5864)
         {
            if(this._5858)
            {
               this._5863.push(this._5864);
            }
            else
            {
               this._5863.shift();
            }
         }
      }
      
      private function _5855(param1:XML, param2:Array) : void
      {
         var _loc4_:XML = null;
         var _loc3_:XMLList = param1.children();
         for each(_loc4_ in _loc3_)
         {
            param2.push(_loc4_);
            if(this._5857.indexOf(_loc4_) != -1)
            {
               this._5855(_loc4_,param2);
            }
         }
      }
      
      public function _4521(param1:Object) : Boolean
      {
         if(!(param1 is XML))
         {
            return false;
         }
         return XML(param1).children().length() > 0;
      }
      
      public function _4530(param1:Object) : Boolean
      {
         return this._5857.indexOf(param1) != -1;
      }
      
      public function _4529(param1:Object, param2:Boolean = true) : void
      {
         if(!(param1 is XML))
         {
            return;
         }
         if(param2)
         {
            this._4752(param1 as XML);
         }
         else
         {
            this._4745(param1 as XML);
         }
      }
      
      private function _4752(param1:XML) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:XML = null;
         var _loc2_:int = int(this._5863.indexOf(param1));
         if(_loc2_ != -1 && this._5857.indexOf(param1) == -1)
         {
            this._5857.push(param1);
            _loc3_ = [];
            this._5855(param1,_loc3_);
            _loc4_ = _loc2_;
            while(_loc3_.length)
            {
               _loc4_++;
               _loc5_ = _loc3_.shift();
               this._5863.splice(_loc4_,0,_loc5_);
               this._5853(_1178.ADD,_loc4_,-1,[_loc5_]);
            }
            this._5853(_1178.OPEN,_loc2_,_loc2_,[param1]);
         }
      }
      
      private function _4745(param1:XML) : void
      {
         var _loc3_:Array = null;
         var _loc4_:XML = null;
         var _loc2_:int = int(this._5857.indexOf(param1));
         if(_loc2_ == -1)
         {
            return;
         }
         this._5857.splice(_loc2_,1);
         _loc2_ = int(this._5863.indexOf(param1));
         if(_loc2_ != -1)
         {
            _loc3_ = [];
            this._5855(param1,_loc3_);
            _loc2_++;
            while(_loc3_.length)
            {
               _loc4_ = this._5863.splice(_loc2_,1)[0];
               this._5853(_1178.REMOVE,_loc2_,-1,[_loc4_]);
               _loc3_.shift();
            }
            _loc2_--;
            this._5853(_1178.CLOSE,_loc2_,_loc2_,[param1]);
         }
      }
      
      public function _5862(param1:Object) : int
      {
         var _loc2_:int = 0;
         if(!(param1 is XML))
         {
            return _loc2_;
         }
         var _loc3_:XML = param1.parent();
         while(_loc3_)
         {
            _loc2_++;
            _loc3_ = _loc3_.parent();
         }
         if(_loc2_ > 0 && !this._5858)
         {
            _loc2_--;
         }
         return _loc2_;
      }
      
      public function refresh() : void
      {
         this._5863 = [];
         if(this._5864)
         {
            if(this._5858)
            {
               this._5863.push(this._5864);
            }
            this._5855(this._5864,this._5863);
         }
         this._5853(_1178.REFRESH);
      }
      
      private function _5853(param1:String = null, param2:int = -1, param3:int = -1, param4:Array = null, param5:Array = null) : void
      {
         var _loc6_:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE,false,false,param1,param2,param3,param4,param5);
         dispatchEvent(_loc6_);
      }
   }
}

