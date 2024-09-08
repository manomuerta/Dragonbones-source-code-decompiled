package _477
{
   import _120._121;
   import _120._122;
   import egret.utils.FileUtil;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class _492 extends _494
   {
      private var _3607:String;
      
      private var _3605:Array;
      
      public function _492(param1:String, param2:Array)
      {
         super();
         this._3607 = param1;
         this._3605 = param2;
      }
      
      override public function run() : void
      {
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:Array = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:BitmapData = null;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:_122 = null;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:String = _3238.ouputPath + _3238.outputFolder;
         _3613.ouputPath = FileUtil.escapePath(_loc2_);
         var _loc3_:Object = _3613._3614[this._3607];
         if(_loc3_)
         {
            _loc6_ = [];
            _loc7_ = new Point(int.MAX_VALUE,int.MAX_VALUE);
            _loc8_ = new Point(int.MIN_VALUE,int.MIN_VALUE);
            for(_loc13_ in _loc3_)
            {
               if(this._3605.indexOf(_loc13_) != -1)
               {
                  _loc4_ = _loc3_[_loc13_];
                  _loc17_ = 0;
                  _loc18_ = int(_loc4_.length);
                  while(_loc17_ < _loc18_)
                  {
                     _loc5_ = _loc4_[_loc17_];
                     if(_loc5_.assetData == null)
                     {
                        _loc5_.assetData = _loc5_.bitmapData;
                        delete _loc5_.bitmapData;
                     }
                     _loc11_ = _loc5_.assetData;
                     _loc9_ = Number(_loc5_.povitX);
                     _loc10_ = Number(_loc5_.povitY);
                     if(_loc7_.x > _loc9_)
                     {
                        _loc7_.x = _loc9_;
                     }
                     if(_loc7_.y > _loc10_)
                     {
                        _loc7_.y = _loc10_;
                     }
                     if(_loc8_.x < _loc9_ + _loc11_.width)
                     {
                        _loc8_.x = _loc9_ + _loc11_.width;
                     }
                     if(_loc8_.y < _loc10_ + _loc11_.height)
                     {
                        _loc8_.y = _loc10_ + _loc11_.height;
                     }
                     _loc6_.push(_loc5_);
                     _loc17_++;
                  }
               }
            }
            _loc14_ = _loc8_.x - _loc7_.x;
            _loc15_ = _loc8_.y - _loc7_.y;
            _loc16_ = new _122();
            if(_loc6_.length > 0)
            {
               _loc1_ = 0;
               _loc12_ = int(_loc6_.length);
               while(_loc1_ < _loc12_)
               {
                  _loc16_._2389(new SaveSpriteSheetFileTask(_loc6_[_loc1_],_loc14_,_loc15_,-_loc7_.x,-_loc7_.y));
                  _loc1_++;
               }
               _loc16_.addEventListener(_121.COMPLETE,this._3702);
               _loc16_.addEventListener(_121.FAIL,this._3703);
               _loc16_.addEventListener(_121.PROGRESS,this._3701);
               _loc16_.run();
            }
            else
            {
               fail(ExportController.EXPORT_ERROR_NO_DATA,null);
            }
         }
         else
         {
            fail(ExportController.EXPORT_ERROR_NO_DATA,null);
         }
      }
      
      private function _3701(param1:_121) : void
      {
         dispatchEvent(param1);
      }
      
      private function _3703(param1:_121) : void
      {
         param1.target.removeEventListener(_121.COMPLETE,this._3702);
         param1.target.removeEventListener(_121.FAIL,this._3703);
         param1.target.removeEventListener(_121.PROGRESS,this._3701);
         fail(param1.data.type,param1.data.data);
      }
      
      private function _3702(param1:_121) : void
      {
         param1.target.removeEventListener(_121.COMPLETE,this._3702);
         param1.target.removeEventListener(_121.FAIL,this._3703);
         param1.target.removeEventListener(_121.PROGRESS,this._3701);
         complete();
      }
   }
}

