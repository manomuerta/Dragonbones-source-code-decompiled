package _586
{
   import _13._12;
   import _470._469;
   import _51._70;
   import _51._79;
   import _724._725;
   import _783.CommandNotification;
   import _783.SheetNotification;
   import _783.StageNotification;
   import _953._963;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   
   public class _13204 extends _603
   {
      public function _13204()
      {
         super();
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _5333._10761 = _599.TRANSFORM_TRANSLATE;
         _1565(StageNotification.DRAG_IAMGE_TO_STAGE,this._5375);
         _1565(StageNotification.DRAG_IAMGES_TO_STAGE,this._5375);
      }
      
      override protected function init() : void
      {
         super.init();
         this._5069();
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         _5333._10761 = _599.TRANSFORM_FREE;
         _1564(StageNotification.DRAG_IAMGE_TO_STAGE,this._5375);
         _1564(StageNotification.DRAG_IAMGES_TO_STAGE,this._5375);
      }
      
      override protected function _4023(param1:StageNotification) : void
      {
         _5335._1897 = null;
         _5333._5306();
         _5350._5374(_2226._2889);
         _5141._5373();
         this._4222();
         this._5069();
      }
      
      public function _5376(param1:Number, param2:Number, param3:uint) : void
      {
         var _loc4_:_963 = _5141 as _963;
         if(_loc4_)
         {
            _loc4_._3233 = param1;
            _loc4_._3231 = param2;
            _loc4_._4066 = param3;
         }
      }
      
      private function _5375(param1:StageNotification) : void
      {
         var _loc4_:_70 = null;
         var _loc5_:Vector.<_725> = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:Point = param1.data.position;
         var _loc3_:Array = [];
         if(param1.data.imageFile is _725)
         {
            _loc4_ = _70._2090(param1.data.imageFile as _725);
            if(_loc4_)
            {
               _loc3_.push(_loc4_);
            }
         }
         else if(param1.data.imageFile is Vector.<_725>)
         {
            _loc5_ = param1.data.imageFile as Vector.<_725>;
            _loc6_ = 0;
            _loc7_ = int(_loc5_.length);
            while(_loc6_ < _loc7_)
            {
               _loc4_ = _70._2090(_loc5_[_loc6_] as _725);
               if(_loc4_)
               {
                  _loc3_.push(_loc4_);
               }
               _loc6_++;
            }
         }
         if(_loc3_.length > 0)
         {
            this._5342(_loc3_,[_loc2_]);
         }
      }
      
      override protected function _4222() : void
      {
         _4314 = _12.CURSOR_MOVE;
      }
      
      override protected function _5342(param1:Array, param2:Array, param3:Boolean = false) : void
      {
         var _loc7_:Object = null;
         var _loc8_:_70 = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc4_:_79 = _2762._1780[0];
         var _loc5_:String = _2762._1795.name;
         var _loc6_:Array = [];
         _loc10_ = 0;
         _loc9_ = int(param1.length);
         while(_loc10_ < _loc9_)
         {
            _loc8_ = param1[_loc10_];
            if(!_loc4_._2159(_loc8_.name))
            {
               _loc7_ = _469._2895(_loc8_,_loc5_,_loc4_);
               _loc6_.push(_loc7_);
            }
            else
            {
               _loc11_ = _loc4_._13231(_loc8_.name);
               _loc8_._13228 = _loc11_;
               _loc7_ = _469._2895(_loc8_,_loc5_,_loc4_);
               _loc6_.push(_loc7_);
            }
            _loc10_++;
         }
         _1567(new CommandNotification(CommandNotification.ADD_SHEET_FRAMES,_loc6_));
      }
      
      override protected function _5129(param1:MouseEvent) : void
      {
      }
      
      private function _5069() : void
      {
         var _1837:_79 = null;
         var _2889:Array = null;
         if(_2226._2484 == null)
         {
            if(_3028 != null)
            {
               _1837 = _3028._1780[0];
               if(_1837)
               {
                  _2889 = _2226._2889;
                  _2889.push(_1837);
                  setTimeout(function():void
                  {
                     _1567(new SheetNotification(SheetNotification.UPDATE_CUR_DISPLAY));
                  },1);
               }
            }
         }
      }
   }
}

