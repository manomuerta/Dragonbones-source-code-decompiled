package _477
{
   import _120._121;
   import _120._123;
   import _1315._1319;
   import _204._210;
   import _609.HandleBackgroundColorTask;
   import _609.HandleSquareTask;
   import _609._611;
   import _609._612;
   import _609._613;
   import _609._616;
   import _609._618;
   import _721._720;
   import _777._779;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.utils.ByteArray;
   import zero.zip.Zip;
   
   public class _496 extends _494
   {
      private var _10735:Boolean;
      
      public function _496(param1:Boolean = true)
      {
         super();
         this._10735 = param1;
      }
      
      override public function run() : void
      {
         if(!_3238.exportTexture && this._10735)
         {
            complete();
            return;
         }
         var _loc1_:_123 = new _123();
         _loc1_._2389(new _611());
         _loc1_._2389(new _612());
         _loc1_._2389(new _618());
         _loc1_._2389(new _613());
         _loc1_._2389(new HandleSquareTask());
         _loc1_._2389(new HandleBackgroundColorTask());
         _loc1_._2389(new _616());
         _loc1_.addEventListener(_121.COMPLETE,this._3702);
         _loc1_.addEventListener(_121.FAIL,this._3703);
         _loc1_.run();
      }
      
      private function _3702(param1:_121) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Vector.<BitmapData> = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:Zip = null;
         var _loc10_:Date = null;
         if(_3238.exportTexture)
         {
            _loc2_ = int(_3613._3609._3705.length);
            if(Boolean(_3613._3609._3690) && _3613._3609._3690.length > 0)
            {
               _loc3_ = _3613._3609._3690;
            }
            else
            {
               _loc3_ = _3613._3609._3691;
            }
            _loc4_ = 0;
            if(_loc3_)
            {
               _loc4_ = int(_loc3_.length);
            }
            _loc5_ = _3238.outputName + "_tex";
            if(_3238.exportType == _720.EXPORT_TYPE_SPINE && _3238.imageType == _720.IMAGE_TYPE_TEXTURE)
            {
               _loc5_ = _3238.outputName;
            }
            if(_loc2_ > 0 && _loc4_ > 0)
            {
               _loc6_ = _loc2_ > 1 && _loc4_ > 1;
               _loc8_ = _779.instance._10304();
               if(_loc8_)
               {
                  _loc9_ = new Zip();
                  _loc10_ = new Date();
               }
               _loc7_ = 0;
               while(_loc7_ < _loc2_)
               {
                  this._3704(_loc6_ ? _loc5_ + "_" + _loc7_ : _loc5_,_3613._3609._3705[_loc7_],_loc3_[_loc7_],_loc9_,_loc10_);
                  _loc7_++;
               }
               if(_loc8_)
               {
                  _779.instance._10305(_3238.projectName + ".zip",_loc9_.encode());
               }
            }
         }
         complete();
      }
      
      private function _3704(param1:String, param2:Array, param3:BitmapData, param4:Zip = null, param5:Date = null) : void
      {
         var _loc8_:int = 0;
         var _loc12_:Object = null;
         var _loc13_:Object = null;
         var _loc14_:int = 0;
         var _loc15_:ByteArray = null;
         var _loc16_:String = null;
         var _loc17_:ByteArray = null;
         var _loc18_:ByteArray = null;
         var _loc19_:Number = NaN;
         var _loc20_:BitmapData = null;
         var _loc21_:Matrix = null;
         var _loc6_:Object;
         (_loc6_ = {}).name = _3238.projectName;
         if(_3238.outputName)
         {
            _loc6_.name = _3238.outputName;
         }
         _loc6_.imagePath = param1 + ".png";
         _loc6_.width = param3.width;
         _loc6_.height = param3.height;
         var _loc7_:int = 0;
         var _loc9_:Object = {};
         _loc7_ = 0;
         _loc8_ = int(param2.length);
         while(_loc7_ < _loc8_)
         {
            if(_loc9_[param2[_loc7_].name])
            {
               param2.splice(_loc7_,1);
               _loc7_--;
               _loc8_--;
            }
            else
            {
               _loc9_[param2[_loc7_].name] = true;
            }
            _loc7_++;
         }
         _loc6_.SubTexture = param2;
         var _loc10_:ByteArray = new ByteArray();
         var _loc11_:_1319 = new _1319();
         if(param3)
         {
            _loc12_ = null;
            _loc13_ = {
               "path":_3613.ouputPath + param1 + ".png",
               "data":_loc11_.encode(param3)
            };
            _3613._3676.push(_loc13_);
            switch(_3238.dataType)
            {
               case _720.DATA_TYPE_JSON:
                  _loc12_ = {
                     "path":_3613.ouputPath + param1 + ".json",
                     "data":JSON.stringify(_loc6_)
                  };
                  break;
               case _720.DATA_TYPE_XML:
                  _loc12_ = {
                     "path":_3613.ouputPath + param1 + ".xml",
                     "data":_210(_loc6_,"TextureAtlas")
                  };
            }
            if(!this._2222)
            {
               this._2222 = {
                  "textureAtlases":[],
                  "textures":[]
               };
            }
            this._2222.textureAtlases.push(_loc12_);
            this._2222.textures.push(_loc13_);
            _3613._3676.push(_loc12_);
            if(param4)
            {
               _loc14_ = 256;
               if(param3.width > _loc14_ || param3.height > _loc14_)
               {
                  _loc19_ = param3.width > param3.height ? _loc14_ / param3.width : _loc14_ / param3.height;
                  _loc20_ = new BitmapData(Math.ceil(param3.width * _loc19_),Math.ceil(param3.height * _loc19_));
                  _loc21_ = new Matrix();
                  _loc21_.scale(_loc19_,_loc19_);
                  _loc20_.draw(param3,_loc21_);
                  _loc6_.originWidth = param3.width;
                  _loc6_.originHeight = param3.height;
                  _loc15_ = _loc11_.encode(_loc20_);
                  _loc16_ = JSON.stringify(_loc6_);
               }
               else
               {
                  _loc15_ = _loc11_.encode(param3);
                  _loc16_ = JSON.stringify(_loc6_);
               }
               _loc17_ = new ByteArray();
               _loc17_.writeUTFBytes(_loc16_);
               param4.add(_loc15_,param1 + ".png",param5);
               param4.add(_loc17_,param1 + ".json",param5);
               _loc18_ = new ByteArray();
               _loc18_.writeUTFBytes(JSON.stringify(_3613._3675));
               param4.add(_loc18_,_3238.outputName + "_ske" + ".json");
            }
         }
      }
      
      private function _3703(param1:_121) : void
      {
         fail(param1.data.type,param1.data.data);
      }
   }
}

