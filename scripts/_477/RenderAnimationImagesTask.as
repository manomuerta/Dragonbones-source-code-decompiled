package _477
{
   import _11111._11110;
   import _13492._13496;
   import _13503._13502;
   import _13505._13504;
   import _13505._13507;
   import _13505._13508;
   import _1404._1407;
   import _51._50;
   import _586._596;
   
   public class RenderAnimationImagesTask extends _494
   {
      private var _3605:String;
      
      private var _3607:String;
      
      public function RenderAnimationImagesTask(param1:String, param2:String)
      {
         super();
         this._3605 = param2;
         this._3607 = param1;
      }
      
      override public function run() : void
      {
         var _1886:_50;
         var _1992:_13502 = null;
         var totalFrame:int = 0;
         var animationName:String = null;
         var i:int = 0;
         var len:int = 0;
         var o:Object = null;
         var framesData:Array = [];
         if(Boolean(_3613._3614[this._3607]) && Boolean(_3613._3614[this._3607][this._3605]))
         {
            framesData = _3613._3614[this._3607][this._3605];
            complete();
            return;
         }
         _1886 = _3238.dragonBonesVO._2107(this._3607);
         if(_1886)
         {
            _1992 = _1886._13656(this._3605);
            if(_1992)
            {
               this._3443._3606(_1886);
               this._3443._3604(_1992);
               _1992._1874();
               totalFrame = _1992.duration;
               if(totalFrame == 0)
               {
                  totalFrame = 1;
               }
               animationName = _1992.name;
               i = 0;
               len = totalFrame;
               while(i < len)
               {
                  if(this._3708(_1886,_1992,i))
                  {
                     try
                     {
                        o = this._3443._3681(i,true);
                     }
                     catch(e:Error)
                     {
                        _11110.instance._11204._11132("RenderAnimationImagesTask::run",e);
                        fail(ExportController.EXPORT_OUT_MEMORY);
                        return;
                     }
                     o.name = animationName + "_" + i;
                     o.frame = i;
                     if(i == 0)
                     {
                        o.total = totalFrame;
                     }
                     framesData.push(o);
                  }
                  i++;
               }
               if(_3613._3614[this._3607] == null)
               {
                  _3613._3614[this._3607] = {};
               }
               _3613._3614[this._3607][this._3605] = framesData;
               _1992._1868();
               complete();
            }
            else
            {
               fail(ExportController.EXPORT_ERROR_UNKNOW,null);
            }
         }
         else
         {
            fail(ExportController.EXPORT_ERROR_UNKNOW,null);
         }
      }
      
      private function _3708(param1:_50, param2:_13502, param3:int) : Boolean
      {
         var _loc4_:_13508 = null;
         var _loc5_:_13496 = null;
         var _loc6_:_13496 = null;
         var _loc7_:_13507 = null;
         var _loc8_:_13496 = null;
         var _loc9_:_13496 = null;
         var _loc12_:_13504 = null;
         var _loc13_:_13496 = null;
         var _loc14_:_13496 = null;
         if(param3 == 0)
         {
            return true;
         }
         var _loc10_:int = 0;
         var _loc11_:int = int(param2._1745.length);
         while(_loc10_ < _loc11_)
         {
            _loc4_ = param2._1745[_loc10_];
            if((_loc5_ = _loc4_._13599.getFrameByIndex(param3)) == null)
            {
               _loc5_ = _loc4_._13572.getFrameByIndex(param3);
            }
            if(_loc5_ == null)
            {
               _loc6_ = _loc4_._13599._1933(param3);
               if(_loc6_ == null)
               {
                  _loc6_ = _loc4_._13572._1933(param3);
               }
            }
            if(_loc5_)
            {
               return true;
            }
            if(Boolean(_loc6_) && _loc6_._13642)
            {
               return true;
            }
            _loc10_++;
         }
         _loc10_ = 0;
         _loc11_ = int(param2._1753.length);
         while(_loc10_ < _loc11_)
         {
            _loc7_ = param2._1753[_loc10_];
            _loc8_ = _loc7_.getFrameByIndex(param3);
            _loc9_ = _loc7_._1933(param3);
            if(_loc8_)
            {
               return true;
            }
            if(Boolean(_loc9_) && _loc9_._13642)
            {
               return true;
            }
            _loc10_++;
         }
         _loc10_ = 0;
         _loc11_ = int(param2._1746.length);
         while(_loc10_ < _loc11_)
         {
            _loc12_ = param2._1746[_loc10_];
            if((_loc13_ = _loc12_._13581.getFrameByIndex(param3)) == null)
            {
               _loc13_ = _loc12_._13586.getFrameByIndex(param3);
            }
            if(_loc13_ == null)
            {
               _loc13_ = _loc12_._13598.getFrameByIndex(param3);
            }
            if(_loc13_ == null)
            {
               _loc14_ = _loc12_._13581._1933(param3);
               if(_loc14_ == null)
               {
                  _loc14_ = _loc12_._13586._1933(param3);
               }
               if(_loc14_ == null)
               {
                  _loc14_ = _loc12_._13598._1933(param3);
               }
            }
            if(_loc13_)
            {
               return true;
            }
            if(Boolean(_loc14_) && _loc14_._13642)
            {
               return true;
            }
            _loc10_++;
         }
         return false;
      }
      
      private function get _3443() : _596
      {
         return _1407.getInstance(_596) as _596;
      }
   }
}

