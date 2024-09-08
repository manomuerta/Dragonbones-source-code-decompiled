package _477
{
   import _1315._1319;
   import _13492._13491;
   import _13503._13502;
   import _13505._13506;
   import _40._44;
   import _51._50;
   import _73._75;
   import egret.utils.FileUtil;
   import flash.display.BitmapData;
   
   public class _490 extends _494
   {
      private var _3607:String;
      
      public function _490(param1:String)
      {
         super();
         this._3607 = param1;
      }
      
      override public function run() : void
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:BitmapData = null;
         var _loc10_:Array = null;
         var _loc11_:Object = null;
         var _loc12_:Object = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc17_:Object = null;
         var _loc18_:_50 = null;
         var _loc19_:_13502 = null;
         var _loc20_:String = null;
         var _loc21_:_1319 = null;
         var _loc22_:Vector.<BitmapData> = null;
         var _loc23_:_13491 = null;
         var _loc24_:_44 = null;
         var _loc25_:_13506 = null;
         var _loc26_:String = null;
         var _loc27_:Object = null;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Object = null;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc1_:String = _3238.ouputPath + _3238.outputFolder;
         _3613.ouputPath = FileUtil.escapePath(_loc1_);
         var _loc2_:Object = {};
         var _loc3_:Object = {};
         var _loc8_:* = _3238.outputName + "_tex.png";
         _loc2_["file"] = _loc8_;
         _loc2_["res"] = {};
         if(_3613._3609._3693)
         {
            _loc5_ = 0;
            _loc6_ = int(_3613._3609._3693.length);
            while(_loc5_ < _loc6_)
            {
               _loc4_ = _3613._3609._3693[_loc5_];
               _loc3_[_loc4_.name] = _loc4_;
               _loc2_["res"][_loc4_.name] = {
                  "x":_loc4_.x,
                  "y":_loc4_.y,
                  "w":_loc4_.width,
                  "h":_loc4_.height
               };
               _loc5_++;
            }
         }
         var _loc9_:Object = {};
         var _loc15_:int = 1;
         var _loc16_:String = _3238.projectName;
         _loc9_[_loc16_] = {
            "frames":[],
            "frameRate":24,
            "labels":[],
            "events":[]
         };
         _loc17_ = _3613._3614[this._3607];
         _loc18_ = _3238.dragonBonesVO._2107(this._3607);
         for(_loc20_ in _loc17_)
         {
            _loc10_ = _loc17_[_loc20_];
            _loc5_ = 0;
            _loc6_ = int(_loc10_.length);
            while(_loc5_ < _loc6_)
            {
               _loc11_ = _loc10_[_loc5_];
               if(_loc5_ == 0)
               {
                  _loc13_ = int(_loc11_.total);
               }
               if(_loc5_ + 1 < _loc6_)
               {
                  _loc12_ = _loc10_[_loc5_ + 1];
                  _loc14_ = int(_loc12_.frame);
               }
               else
               {
                  _loc14_ = _loc13_;
               }
               _loc26_ = !!_loc11_.empty ? "" : _loc11_.name;
               _loc27_ = _loc3_[_loc26_];
               _loc28_ = 0;
               _loc29_ = 0;
               if(_loc27_)
               {
                  if(_loc27_.frameWidth)
                  {
                     _loc28_ = Number(_loc27_.frameX);
                  }
                  if(_loc27_.frameHeight)
                  {
                     _loc29_ = Number(_loc27_.frameY);
                  }
               }
               _loc30_ = {
                  "res":_loc26_,
                  "x":Math.round((_loc11_.povitX - _loc28_) * _3238.scale),
                  "y":Math.round((_loc11_.povitY - _loc29_) * _3238.scale),
                  "duration":_loc14_ - _loc11_.frame
               };
               _loc9_[_loc16_].frames.push(_loc30_);
               _loc5_++;
            }
            _loc9_[_loc16_].labels.push({
               "name":_loc20_,
               "frame":_loc15_,
               "end":_loc15_ + _loc13_ - 1
            });
            _loc19_ = _loc18_._13656(_loc20_);
            if(_loc25_ = _loc19_._13597)
            {
               _loc5_ = 0;
               _loc6_ = int(_loc25_._1816.length);
               while(_loc5_ < _loc6_)
               {
                  _loc23_ = _loc25_._1816[_loc5_] as _13491;
                  _loc31_ = 0;
                  _loc32_ = int(_loc23_._13637.length);
                  while(_loc31_ < _loc32_)
                  {
                     _loc24_ = _loc23_._13637[_loc31_];
                     if(_loc24_._1622 == _75.DISPATCH_EVENT)
                     {
                        _loc9_[_loc16_].events.push({
                           "name":"@" + _loc24_.value,
                           "frame":_loc15_ + _loc23_.startPos
                        });
                     }
                     _loc31_++;
                  }
                  _loc5_++;
               }
            }
            _loc15_ += _loc13_;
            _loc9_[_loc16_].frameRate = _loc19_.frameRate;
         }
         _loc2_["mc"] = _loc9_;
         _loc21_ = new _1319();
         if(Boolean(_3613._3609._3690) && _3613._3609._3690.length > 0)
         {
            _loc22_ = _3613._3609._3690;
         }
         else
         {
            _loc22_ = _3613._3609._3691;
         }
         if(_loc22_ != null && _loc22_.length > 0)
         {
            _loc7_ = _loc22_[0];
            if(_loc7_)
            {
               if(_3238.exportTexture)
               {
                  _3613._3676.push({
                     "path":_3613.ouputPath + _loc8_,
                     "data":_loc21_.encode(_loc7_)
                  });
               }
            }
            if(_3238.exportData)
            {
               _3613._3676.push({
                  "path":_3613.ouputPath + _3238.outputName + "_mc" + ".json",
                  "data":JSON.stringify(_loc2_)
               });
            }
            complete();
         }
         else
         {
            fail(ExportController.EXPORT_ERROR_NO_DATA);
         }
      }
   }
}

