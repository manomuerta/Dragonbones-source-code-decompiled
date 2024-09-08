package _586
{
   import _24._26;
   import _648._647;
   import _708._717;
   import _783.CommandNotification;
   import _93._94;
   import egret.utils.tr;
   
   public class _585 extends _94
   {
      private var _4988:Object;
      
      private var _4986:Object;
      
      private var _4987:Object;
      
      private var _4985:Object;
      
      public var _4989:String;
      
      public var _4984:Array;
      
      public function _585()
      {
         this._4986 = {};
         this._4987 = {};
         this._4985 = {};
         super();
         this._4986[_26.SELECT_GROUP_0] = _26.STORE_GROUP_0;
         this._4986[_26.SELECT_GROUP_1] = _26.STORE_GROUP_1;
         this._4986[_26.SELECT_GROUP_2] = _26.STORE_GROUP_2;
         this._4986[_26.SELECT_GROUP_3] = _26.STORE_GROUP_3;
         this._4986[_26.SELECT_GROUP_4] = _26.STORE_GROUP_4;
         this._4986[_26.SELECT_GROUP_5] = _26.STORE_GROUP_5;
         this._4986[_26.SELECT_GROUP_6] = _26.STORE_GROUP_6;
         this._4986[_26.SELECT_GROUP_7] = _26.STORE_GROUP_7;
         this._4986[_26.SELECT_GROUP_8] = _26.STORE_GROUP_8;
         this._4986[_26.SELECT_GROUP_9] = _26.STORE_GROUP_9;
         this._4987[_26.STORE_GROUP_0] = 0;
         this._4987[_26.STORE_GROUP_1] = 1;
         this._4987[_26.STORE_GROUP_2] = 2;
         this._4987[_26.STORE_GROUP_3] = 3;
         this._4987[_26.STORE_GROUP_4] = 4;
         this._4987[_26.STORE_GROUP_5] = 5;
         this._4987[_26.STORE_GROUP_6] = 6;
         this._4987[_26.STORE_GROUP_7] = 7;
         this._4987[_26.STORE_GROUP_8] = 8;
         this._4987[_26.STORE_GROUP_9] = 9;
      }
      
      public function get _3545() : Object
      {
         if(!_2214._1844)
         {
            this._4988 = {};
         }
         else
         {
            this._4988 = _2214._1844._2871._3536;
         }
         if(!this._4988)
         {
            this._4988 = {};
         }
         return this._4988;
      }
      
      public function _3318(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         if(_2226._2889.length)
         {
            _loc2_ = _2226._2889;
         }
         else if(this._4984)
         {
            _loc2_ = this._4984;
         }
         if(_loc2_)
         {
            this._4989 = param1;
            this._4984 = _loc2_;
            this._3545[param1] = this._4982(_loc2_);
            _loc3_ = tr("Tip.Bone.Group.Success",this._3869(_loc2_),this.shortcut);
            _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
               "showText":_loc3_,
               "type":_717.ANIMATE
            }));
         }
      }
      
      public function _3319() : Boolean
      {
         if(this._3545[this._4989])
         {
            delete this._3545[this._4989];
            _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
               "showText":tr("Tip.Bone.Group.Undo"),
               "type":_717.ANIMATE
            }));
            return true;
         }
         return false;
      }
      
      private function _4982(param1:Array) : Array
      {
         var _loc3_:Object = null;
         var _loc4_:_647 = null;
         if(!param1 || !param1.length)
         {
            return null;
         }
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            if(_loc3_)
            {
               (_loc4_ = new _647()).data = _loc3_;
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
      
      private function _4983(param1:Array) : Array
      {
         var _loc3_:_647 = null;
         if(!param1 || !param1.length)
         {
            return null;
         }
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            if(!(!_loc3_ || _loc3_.data == null))
            {
               if(_loc3_.visible)
               {
                  _loc2_.push(_loc3_.data);
               }
            }
         }
         return _loc2_;
      }
      
      private function _3869(param1:Array) : String
      {
         var _loc2_:* = "";
         if(param1.length)
         {
            if(param1.length == 1)
            {
               if(param1[0].hasOwnProperty("name"))
               {
                  _loc2_ = param1[0].name;
               }
            }
            else
            {
               _loc2_ = param1.length + "";
            }
         }
         return _loc2_;
      }
      
      private function get shortcut() : int
      {
         var _loc1_:int = 0;
         return int(this._4987[this._4989]);
      }
      
      public function _3320(param1:String) : void
      {
         if(this._3545[this._4986[param1]])
         {
            _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,this._4983(this._3545[this._4986[param1]])));
         }
      }
      
      public function _3323(param1:Array) : void
      {
         var _loc2_:Array = null;
         var _loc3_:_647 = null;
         var _loc4_:Object = null;
         if(param1 && param1.length && Boolean(this._3545))
         {
            for each(_loc2_ in this._3545)
            {
               for each(_loc3_ in _loc2_)
               {
                  for each(_loc4_ in param1)
                  {
                     if(_loc3_.data == _loc4_)
                     {
                        _loc3_.visible = false;
                     }
                  }
               }
            }
         }
      }
      
      public function _3322(param1:Array) : void
      {
         var _loc2_:Array = null;
         var _loc3_:_647 = null;
         var _loc4_:Object = null;
         if(param1 && param1.length && Boolean(this._3545))
         {
            for each(_loc2_ in this._3545)
            {
               for each(_loc3_ in _loc2_)
               {
                  for each(_loc4_ in param1)
                  {
                     if(_loc3_.data == _loc4_)
                     {
                        _loc3_.visible = true;
                     }
                  }
               }
            }
         }
      }
   }
}

