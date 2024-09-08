package _586
{
   import _13492._13495;
   import _13503._13502;
   import _13505._13504;
   import _13505._13508;
   import _470._469;
   import _51._50;
   import _51._52;
   import _51._79;
   import _724._725;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _81._82;
   import _953._963;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _604 extends _603
   {
      public function _604()
      {
         super();
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(StageNotification.DRAG_IAMGE_TO_STAGE,this._5375);
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         _1564(StageNotification.DRAG_IAMGE_TO_STAGE,this._5375);
      }
      
      override protected function _4023(param1:StageNotification) : void
      {
         _5333._5306();
         _5350._5374(_2226._2889);
         _5141._5373();
         _4222();
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
         this._5342([param1.data.imageFile],[param1.data.position]);
      }
      
      override protected function _5342(param1:Array, param2:Array, param3:Boolean = false) : void
      {
         var centerP:Point;
         var i:int;
         var len:int;
         var _3410:Array = null;
         var _11129:Object = null;
         var _1836:_52 = null;
         var _1837:_79 = null;
         var addDisplayToEmptyFrame:Boolean = false;
         var imageFileVO:_725 = null;
         var pos:Point = null;
         var _1886:_50 = null;
         var checkBoneName:Function = null;
         var checkSlotName:Function = null;
         var _1879:_13508 = null;
         var _2710:_13495 = null;
         var position:Point = null;
         var _13225:Array = param1;
         var positionList:Array = param2;
         var absPos:Boolean = param3;
         var _1747:Function = function(param1:String, param2:int, param3:Function):String
         {
            var _loc4_:int = 0;
            var _loc5_:String = param1;
            while(param3(_loc5_,param2))
            {
               _loc5_ = param1 + String(++_loc4_);
            }
            return _loc5_;
         };
         checkBoneName = function(param1:String, param2:int):Boolean
         {
            var _loc3_:int = 0;
            var _loc4_:int = int(_3410.length);
            while(_loc3_ < _loc4_)
            {
               if(_loc3_ != param2 && _3410[_loc3_].newBoneVO && _3410[_loc3_].newBoneVO.name == param1)
               {
                  return true;
               }
               _loc3_++;
            }
            return _1886._1793(param1);
         };
         checkSlotName = function(param1:String, param2:int):Boolean
         {
            var _loc3_:int = 0;
            var _loc4_:int = int(_3410.length);
            while(_loc3_ < _loc4_)
            {
               if(_loc3_ != param2 && _3410[_loc3_].newSlotVO && _3410[_loc3_].newSlotVO.name == param1)
               {
                  return true;
               }
               _loc3_++;
            }
            return _1886._1996(param1);
         };
         _3410 = [];
         var forceNewLayer:Boolean = _13225.length > 1;
         var _1992:_13502 = _2852._13704;
         var curFrameIndex:int = _2852.timeline.curFrame;
         var timeline:_13504 = _2852._4669() as _13504;
         var autoTween:Boolean = _2852.autoTween;
         if(timeline == null)
         {
            forceNewLayer = true;
         }
         else
         {
            _1836 = timeline._1823;
            _1837 = _1836._1882;
            _1879 = _1992._1875(_1837) as _13508;
            _2710 = _1879._13572.getFrameByIndex(curFrameIndex) as _13495;
            if(_2710)
            {
               if(!forceNewLayer && _2710._13613 == null)
               {
                  addDisplayToEmptyFrame = true;
               }
               else
               {
                  forceNewLayer = true;
               }
            }
         }
         centerP = _5141._4428.localToGlobal(new Point());
         _1886 = _5141._2762;
         i = 0;
         len = int(_13225.length);
         while(i < len)
         {
            imageFileVO = _13225[i];
            pos = positionList[i];
            if(absPos)
            {
               position = pos;
            }
            else
            {
               position = new Point((pos.x - centerP.x) / _2580,(pos.y - centerP.y) / _2580);
            }
            _11129 = _469._3481(imageFileVO,_5141._2762._1795.name,_5141._2762,_5141._2762._1990,_1992,_1836,_1837,curFrameIndex,position,forceNewLayer,addDisplayToEmptyFrame,autoTween);
            _3410.push(_11129);
            i++;
         }
         len = int(_3410.length);
         if(len > 1)
         {
            i = 0;
            while(i < len)
            {
               if(_3410[i].newBoneVO)
               {
                  _3410[i].newBoneVO.name = _1747(_3410[i].newBoneVO.name,i,checkBoneName);
                  _3410[i].newSlotVO.name = _1747(_3410[i].newSlotVO.name,i,checkSlotName);
               }
               i++;
            }
         }
         _1567(new CommandNotification(CommandNotification.ADD_DISPLAYS_TO_STAGE,_3410));
      }
      
      override protected function _2174(param1:Rectangle, param2:Array) : Array
      {
         var _loc4_:_52 = null;
         var _loc5_:_79 = null;
         var _loc3_:Array = _82._2174(param1,param2);
         var _loc6_:int = 0;
         var _loc7_:int = int(_loc3_.length);
         while(_loc6_ < _loc7_)
         {
            if(_loc3_[_loc6_] is _52)
            {
               _loc5_ = (_loc3_[_loc6_] as _52)._1882;
            }
            else if(_loc3_[_loc6_] is _79)
            {
               _loc5_ = _loc3_[_loc6_] as _79;
            }
            if(_loc5_ == null || _loc5_._2049 == null)
            {
               _loc3_.splice(_loc6_,1);
               _loc7_--;
               _loc6_--;
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      override public function _3379(param1:Number, param2:Point) : Point
      {
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:_963 = _5141 as _963;
         if(_loc5_)
         {
            _loc3_ = _loc5_._3233;
            _loc4_ = _loc5_._3231;
         }
         var _loc6_:Number = (_3286.zoom - param1) / _3286.zoom;
         var _loc7_:Point;
         (_loc7_ = new Point()).x = param2.x - _loc3_ / 2 * _3286.zoom;
         _loc7_.y = param2.y - _loc4_ / 2 * _3286.zoom;
         var _loc8_:Number = _5141._4871 + _loc7_.x * _loc6_;
         var _loc9_:Number = _5141._4872 + _loc7_.y * _loc6_;
         return new Point(_loc8_,_loc9_);
      }
   }
}

